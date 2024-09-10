extends Node3D
class_name IngredientController

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
signal sending_ingredient(ingredient)
#endregion

#region Variables
@onready var view = %View as IngredientView
@onready var cleaver_view := %CleaverView
var current_ingredient : Ingredient
var states : Dictionary = {}
var current_state : IngredientState
var state_properties : Dictionary = {}
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	# TODO: Conectar com beat aqui
	pass
	
func _process(delta):
	# Manda a atualização de update para o state atual
	if current_state:
		current_state.update(self,delta)
		
	# Verifica se o jogador está enviando o prato
	if Input.is_action_just_pressed("action_down") and current_state and current_state.name == "done":
		RhythmManager.judge_input()
		_send_ingredient()
	
func _physics_process(delta):
	pass
#endregion

#region Public functions
func set_ingredient_by_name(name: StringName):
	var new_ingredient = IngredientData.get_ingredient_by_name(name)
	if(new_ingredient):
		set_ingredient(new_ingredient)

func set_ingredient(ingredient: Ingredient):
	current_ingredient = ingredient
	_clear_states()
	var starting_state : IngredientState
	for state : IngredientState in ingredient.states:
		if !starting_state:
			starting_state = state
		states[state.name] = state
	if starting_state:
		starting_state.enter(self)
		current_state = starting_state
		print(current_state.name)
	view.entry()

func transition(state_name : String, new_state_name : String):
	# Se não foi o state atual que causou a transição, return
	var state = states.get(state_name.to_lower())
	if (state != current_state):
		print("Not current state!")
		return
	
	# Se não existir um state com o nome desejado, return
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("No state with name %s!" % new_state_name)
		return
		
	# Processo de trocar para novo state
	if current_state:
		current_state.exit(self)
	new_state.enter(self)
	current_state = new_state
	
func _cleaver_distance_transition_closer():
	cleaver_view._distance_transition_closer()
		
func _cleaver_distance_transition_farder():
	cleaver_view._distance_transition_farder()
	
#endregion

#region Private functions
func _clear_states():
	current_state = null
	state_properties = {}
	states.clear()
	
func _on_beat():
	if current_state:
		current_state.beat(self)

func _send_ingredient():
	print("Sending ingredient!")
	sending_ingredient.emit(current_ingredient)
	current_ingredient = null
	_clear_states()
	view.send()
	
#endregion

#region Subclasses
#endregion


