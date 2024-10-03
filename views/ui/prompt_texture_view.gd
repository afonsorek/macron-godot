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
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func set_action(action : StringName):
	texture = InputPromptData.get_input_prompt_texture("switch",action)
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


