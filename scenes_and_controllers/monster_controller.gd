extends Node3D
class_name MonsterController

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
signal satisfaction_changed(new_value,delta)
#endregion

#region Variables
var current_monster : Monster
var satisfaction : int:
	set(value):
		satisfaction_changed.emit(value,value-satisfaction)
		satisfaction = value
		
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
	pass
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func receive_recipe(recipe: Recipe) -> void:
	print("Recipe %s received by monster!" % recipe.name)
	var recipe_score := 0
	for element in recipe.get_elements():
		if current_monster.tastes.has(element):
			recipe_score += 2 if current_monster.tastes[element] else -2
		else:
			recipe_score += 1
	print("Recipe score: %d" % recipe_score)
	satisfaction += recipe_score 
	
func set_monster(monster: Monster) -> void:
	view.show()
	current_monster = monster
	current_monster.enter(self)
	satisfaction = monster.max_satisfaction/2
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


