extends HBoxContainer
class_name ButtonSequenceView

#region Enums
#endregion

#region Parameters (consts and exportvars)
@onready var prompt_texture_tscn := preload("res://views/ui/prompt_texture_view.tscn")
@export var prompt_size := Vector2(130,130)
#endregion

#region Signals
#endregion

#region Variables
var allow_press := false
var current_prompt_textures : Array[PromptTextureView]
var current_sequence : Array[String]
var current_idx : int
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	_clear_button_prompts()
	
func _process(_delta):
	_check_current_action()
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func set_sequence(action_sequence: Array[String]):
	current_sequence = action_sequence
	current_idx = 0
	_set_prompt_textures()
#endregion

#region Private functions	
func _check_current_action():
	if !current_sequence or !allow_press:
		return
	if Input.is_action_just_pressed(current_sequence[current_idx]):
		current_prompt_textures[current_idx].press()
		current_idx += 1
		if current_idx >= current_sequence.size():
			current_idx = 0
			current_sequence = []

func _clear_button_prompts():
	current_prompt_textures = []
	for child in get_children():
		child.queue_free()
	
func _set_prompt_textures():
	_clear_button_prompts()
	allow_press = false
	for action in current_sequence:
		var new_prompt : PromptTextureView = prompt_texture_tscn.instantiate()
		add_child(new_prompt)
		new_prompt.animate_press = false
		new_prompt.set_action(action)
		new_prompt.custom_minimum_size = prompt_size
		current_prompt_textures.append(new_prompt)
	await get_tree().create_timer(0.1).timeout # Para não pressionar o próximo botão imediatamente
	allow_press = true
#endregion

#region Subclasses
#endregion


