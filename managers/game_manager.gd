extends Node

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
signal game_ended(result:bool)
#endregion

#region Variables
var game_running := true
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
	
func end_game(result : bool):
	game_running = false
	game_ended.emit(result)
	
func start_run():
	ingredients = ["Potato","Potato"]
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


