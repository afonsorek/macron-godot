extends Node3D
class_name KitchenController

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
@onready var current_monster = %Monster
@onready var ingredient_controller = %Ingredient as IngredientController
@onready var ui_view = %KitchenUIView as KitchenUiView
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
	ingredient_controller.sending_ingredient.connect(ingredient_sent)
	
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
	processed_ingredients.clear()
	
func _process_inputs(_delta):
	if is_selecting_ingredient && Input.is_action_just_pressed("Y"):
		ingredient_controller.set_ingredient_by_name("batata")
		ui_view.hide_select_ingredient()
	elif Input.is_action_just_pressed("select_ingredient"):
		is_selecting_ingredient = true
		ui_view.show_select_ingredient()
	elif Input.is_action_just_released("select_ingredient"):
		is_selecting_ingredient = false
		ui_view.hide_select_ingredient()
	
#endregion

#region Subclasses
#endregion

