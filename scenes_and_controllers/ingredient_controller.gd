extends Node3D
class_name IngredientController

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
var current_ingredient : Ingredient
# Sugiro utilizarmos o design pattern de StateMachine para realizar os
# processos de ingredientes no jogo.
# Vídeo-base: https://www.youtube.com/watch?v=ow_Lum-Agbs
var states : Dictionary = {}
var current_state : IngredientState
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	# Para cada node filho de States, registrar o estado
	for child in %States.get_children():
		if child is IngredientState:
			var new_state := child as IngredientState
			if !initial_state:
				initial_state = new_state
			states[child.name.to_lower()] = new_state
			new_state.transitioned.connect(_on_state_transition)
	
func _process(delta):
	# Manda a atualização de update para o state atual
	if current_state:
		current_state.update(delta)
	
func _physics_process(delta):
	pass
#endregion

#region Public functions
func set_ingredient(ingredient: Ingredient):
	current_ingredient = ingredient
	for state : IngredientState in ingredient.states:
		
#endregion

#region Private functions
func _clear_states():
	current_state = null
	states.clear()
	

func _on_state_transition(state : IngredientState, new_state_name : String):
	# Se não foi o state atual que causou a transição, return
	if (state != current_state):
		return
	
	# Se não existir um state com o nome desejado, return
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
		
	# Processo de trocar para novo state
	if current_state:
		current_state.exit()
		
	
#endregion

#region Subclasses
#endregion


