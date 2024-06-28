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
@onready var current_ingredient = %Ingredient as IngredientController
var processed_ingredients : Array[Ingredient] = []
#endregion

#region Computed properties
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
func send_ingredient(ingredient: Ingredient):
	processed_ingredients.append(ingredient)
	if processed_ingredients.size() == 3:
		_make_recipe()
#endregion

#region Private functions
func _make_recipe():
	var ingredient_names = processed_ingredients.map(func(ingredient): return ingredient.name)
	RecipeData.match_recipe(ingredient_names)
#endregion

#region Subclasses
#endregion

