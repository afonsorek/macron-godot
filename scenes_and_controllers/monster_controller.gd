extends Node3D
class_name MonsterController

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var patience_error_value = 4
@export var patience_recovery_value = 3
@export var fed_up_base := 0.7
#endregion

#region Signals
signal satisfaction_changed(new_value,delta)
#endregion

#region Variables
var current_monster : Monster
var received_recipes : Array[Recipe] = []
var patience := 0 :
	set(value):
		if !current_monster:
			patience = value
			return
		patience = clampi(value,0,current_monster.waiting_beats)
var satisfaction : int:
	set(value):
		var delta = value-satisfaction
		satisfaction = clampi(value, 0, current_monster.max_satisfaction)
		satisfaction_changed.emit(satisfaction,delta)
		view.set_monster_position_relative(satisfaction,current_monster.max_satisfaction)
		if value <= 0 or value >= current_monster.max_satisfaction:
			GameManager.end_game(value >= current_monster.max_satisfaction)
		
@onready var view := %View as MonsterView
#endregion

#region Computed properties
var has_monster : bool :
	get: return current_monster != null
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	RhythmManager.beat.connect(_on_beat)
	RhythmManager.input_judged.connect(_on_input_judged)
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func receive_recipe(recipe: Recipe) -> void:
	print("Recipe %s received by monster!" % recipe.name)
	var recipe_score := 0
	# Verificar gostos do monstro
	for element in recipe.get_elements():
		if current_monster.tastes.has(element):
			var multiplier = 1 if current_monster.tastes[element] else -1
			recipe_score += 2 * multiplier
		else:
			recipe_score += 1
	# Monstro se enjoando da receita
	if recipe_score > 0:
		recipe_score *= _fed_up_tax(recipe) 
	
	# Enviar resultados
	print("Recipe score: %d" % recipe_score)
	_change_satisfaction(recipe_score)
	received_recipes.append(recipe)
	
func set_monster(monster: Monster) -> void:
	current_monster = monster
	view = monster.view_tscn.instantiate()
	add_child(view)
	current_monster.enter(self)
	view.entry()
	satisfaction = monster.max_satisfaction/2
	received_recipes = []
	view.set_monster_position_relative(satisfaction,monster.max_satisfaction,true)
	_reset_patience()
#endregion

#region Private functions
func _change_satisfaction(delta: float):
	if (delta >= 0):
		SoundManager.play_monster_reaction_sound(SoundManager.MonsterReaction.SATISFIED)
	else:
		SoundManager.play_monster_reaction_sound(SoundManager.MonsterReaction.UNSATISFIED)
	satisfaction += delta
	
func _fed_up_tax(new_recipe : Recipe) -> float:
	var count := 0
	for recipe : Recipe in received_recipes:
		if recipe.is_same_recipe(new_recipe):
			count += 1
	return fed_up_base ** count
	
func _on_beat():
	if !current_monster:
		return
	patience -= 1
	if patience <= 0:
		_change_satisfaction(-current_monster.satisfaction_damage)
		_reset_patience()
	
func _on_input_judged(result: bool, animate : bool):
	if (result):
		await RhythmManager.beat
		patience += patience_recovery_value
	else:
		patience -= patience_error_value
	
func _reset_patience():
	if !current_monster:
		return
	patience = current_monster.waiting_beats
#endregion

#region Subclasses
#endregion


