extends Node

#region Enums
enum GameState {MAIN_MENU, KITCHEN, PAUSED}
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
signal game_state_changed(game_state : GameState)
#endregion

#region Variables
var game_state := GameState.KITCHEN :
	set(value):
		game_state = value
		game_state_changed.emit(game_state)
var ingredients : Array[StringName] = []
#endregion

#region Computed properties
#endregion

#region Event functions
func _ready():
	IngredientData.initialize_ingredients()
	MonsterData.initialize_monsters()
	RecipeData.initialize_recipes()
	start_run()
#endregion

#region Public functions
func add_ingredient(ingredient_name : StringName):
	ingredients.append(ingredient_name)
	IngredientData.set_ingredient_as_known(ingredient_name)
	
func pause_game():
	if game_state == GameState.KITCHEN:
		game_state = GameState.PAUSED
		get_tree().paused = true
	else: print("Game not pausable right now!")
	
func quit_game():
	get_tree().quit()
	
func start_run():
	ingredients = ["batata"]
	game_state = GameState.KITCHEN
	
func unpause_game():
	if game_state == GameState.PAUSED:
		game_state = GameState.KITCHEN
		get_tree().paused = false
	else: print("Game not unpausable right now!")
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


