extends Node

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
var ingredients : Array[StringName] = []
#endregion

#region Computed properties
#endregion

#region Event functions
func _ready():
	IngredientData.initialize_ingredients()
	MonsterData.initialize_monsters()
	RecipeData.initialize_recipes()
	InputPromptData.initialize_input_prompts()
	start_run()
#endregion

#region Public functions
func add_ingredient(ingredient_name : StringName):
	ingredients.append(ingredient_name)
	IngredientData.set_ingredient_as_known(ingredient_name)
	
func start_run():
	ingredients = ["Potato","Potato"]
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


