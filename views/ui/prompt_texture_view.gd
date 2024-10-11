extends TextureRect
class_name PromptTextureView

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var starting_action : StringName = ""
#endregion

#region Signals
#endregion

#region Variables
var current_prompt : InputPrompt
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	if !starting_action.is_empty():
		set_action(starting_action)
	
func _process(_delta):
	_check_pressed()
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func set_action(action : StringName):
	current_prompt = InputPromptData.get_input_prompt("switch",action)
	texture = current_prompt.texture
#endregion

#region Private functions
func _check_pressed():
	if !current_prompt:
		return
	if Input.is_action_just_pressed(current_prompt.action):
		texture = current_prompt.pressed_texture
	elif Input.is_action_just_released(current_prompt.action):
		texture = current_prompt.texture
#endregion

#region Subclasses
#endregion


