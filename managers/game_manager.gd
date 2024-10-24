extends Node

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
signal game_ended(result:bool)
signal scene_resetted()
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
	InputPromptData.set_system("keyboard")
	start_run()
	
func _process(delta):
	_check_reset()
#endregion

#region Public functions
func add_ingredient(ingredient_name : StringName):
	ingredients.append(ingredient_name)
	IngredientData.set_ingredient_as_known(ingredient_name)
	
func end_game(result : bool):
	game_running = false
	game_ended.emit(result)
	
func start_run():
	ingredients = ["Potato","Apple","Onion","Corn"]
#endregion

#region Private functions
func _check_reset():
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
		scene_resetted.emit()
#endregion

#region Subclasses
#endregion


