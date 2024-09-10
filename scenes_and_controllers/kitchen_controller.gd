extends Node3D
class_name KitchenController

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var initial_state_name : String = "monster_enter"
@export var state_resources : Array[KitchenState]
#endregion

#region Signals
#endregion

#region Variables
@onready var monster_controller := %Monster as MonsterController
@onready var ingredient_controller := %Ingredient as IngredientController
@onready var sizzle_controller := %Sizzle as SizzleController
@onready var ui_view := %KitchenUIView as KitchenUiView
@onready var camera := %MainCamera as CameraController
var current_state : KitchenState
var made_recipe : Recipe
var selected_ingredient_names : Array[String] = []
var states : Dictionary = {}
#endregion

#region Computed properties
var is_selected_ingredients_full: bool:
	get: return selected_ingredient_names.size() >= 3
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	# Connect signals
	monster_controller.satisfaction_changed.connect(_on_satisfaction_changed)
	RhythmManager.beat.connect(_on_beat)
	# Start initial state
	_init_states()
	current_state = states.get(initial_state_name)
	current_state.enter(self)
	
func _process(_delta):
	if current_state:
		current_state.update(self,_delta)
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func add_selected_ingredient(ingredient_name : String):
	selected_ingredient_names.append(ingredient_name)
	while selected_ingredient_names.size() > 3:
		selected_ingredient_names.pop_front()
	print(selected_ingredient_names)
	
func make_recipe(processed_ingredients : Array[Ingredient]):
	print("Making recipe!")
	var ingredient_names : Array[StringName]
	ingredient_names.assign(processed_ingredients.map(func(ingredient): return ingredient.name))
	var recipe_result = RecipeData.match_recipe(ingredient_names)
	if (recipe_result):
		print("Made recipe: %s, with ingredients %s" % [recipe_result.name, recipe_result.ingredients])
		made_recipe = recipe_result
	
func transition_state(current_name: String, new_state_name: String):
	var state = states.get(current_name)
	if (state != current_state):
		print("\"%s\" is not current state!" % current_name)
		return
	var new_state = states.get(new_state_name)
	if !new_state:
		print("No state with key \"%s\"!" % new_state_name)
		return
	if current_state:
		current_state.exit(self)
	new_state.enter(self)
	print("Kitchen State Machine: Exited \"%s\", entered \"%s\"" % [current_name,new_state_name])
	current_state = new_state
#endregion

#region Private functions
func _init_states():
	for state in state_resources:
		states[state.name] = state
	
func _on_beat():
	if current_state:
		current_state.beat(self)
		
func _on_satisfaction_changed(new_value : int, delta : int):
	ui_view.on_satisfaction_changed(new_value, delta, monster_controller.current_monster.max_satisfaction)
#endregion

#region Subclasses
#endregion

