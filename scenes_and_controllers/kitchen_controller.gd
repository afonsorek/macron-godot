extends Node3D
class_name KitchenController

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
@onready var monster_controller := %Monster as MonsterController
@onready var ingredient_controller := %Ingredient as IngredientController
@onready var sizzle_controller := %Sizzle as SizzleController
@onready var ui_view := %KitchenUIView as KitchenUiView
@onready var cleaver_view := %CleaverView
@onready var camera := %MainCamera as CameraController
var made_recipe : Recipe
var processed_ingredients : Array[Ingredient] = []
var is_selecting_ingredient := false
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	# Connect signals
	ingredient_controller.sending_ingredient.connect(ingredient_sent)
	monster_controller.satisfaction_changed.connect(_on_satisfaction_changed)
	# Spawn monster
	_spawn_monster()
	
func _process(_delta):
	_process_inputs(_delta)
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func ingredient_sent(ingredient: Ingredient):
	if !ingredient:
		return
	
	processed_ingredients.append(ingredient)
	print("Ingredient received in KitchenController!")
	print(">>>> I have %d ingredient(s)" % processed_ingredients.size())
	camera._move_view_farder()
	ingredient_controller._cleaver_distance_transition_farder()
	if processed_ingredients.size() == 3:
		_make_recipe()
#endregion

#region Private functions
func _make_recipe():
	print("Making recipe!")
	var ingredient_names : Array[StringName]
	ingredient_names.assign(processed_ingredients.map(func(ingredient): return ingredient.name))
	var recipe_result = RecipeData.match_recipe(ingredient_names)
	if (recipe_result):
		print("Made recipe: %s, with ingredients %s" % [recipe_result.name, recipe_result.ingredients])
		monster_controller.receive_recipe(recipe_result)
	processed_ingredients.clear()
		
func _on_satisfaction_changed(new_value : int, delta : int):
	ui_view.on_satisfaction_changed(new_value, delta, monster_controller.current_monster.max_satisfaction)
	
func _process_inputs(_delta):
	if monster_controller.has_monster:
		if Input.is_action_just_pressed("select_ingredient"):
			_select_ingredient()
		elif is_selecting_ingredient && Input.is_action_just_pressed("action_up"):
			RhythmManager.judge_input()
			ingredient_controller.set_ingredient_by_name("Potato")
			ui_view.hide_select_ingredient()
			camera._move_view_closer()
			ingredient_controller._cleaver_distance_transition_closer()
	if Input.is_action_just_released("select_ingredient"):
		is_selecting_ingredient = false
		ui_view.hide_select_ingredient()

func _select_ingredient():
	is_selecting_ingredient = true
	ui_view.show_select_ingredient()

func _spawn_monster():
	await get_tree().create_timer(2.0).timeout
	# TODO: Get random monster here
	var selected_monster = Monster.new()
	monster_controller.set_monster(selected_monster)
	sizzle_controller.give_tip(selected_monster.tips)
	if !is_selecting_ingredient && Input.is_action_pressed("select_ingredient"):
		_select_ingredient()
	
#endregion

#region Subclasses
#endregion

