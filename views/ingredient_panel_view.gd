extends Panel
class_name IngredientPanelView

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var disabled_color := Color.DIM_GRAY
#endregion

#region Signals
#endregion

#region Variables
@onready var prompt_texture : PromptTextureView = %PromptTexture
var key_action := ""
var enabled := true
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	pass
	
func _process(_delta):
	_check_input(_delta)
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func disable():
	%IngredientTexture.texture = null
	modulate = disabled_color
	enabled = false
	
func enable():
	modulate = Color.WHITE
	enabled = true
	
func set_action(action : StringName):
	key_action = action
	prompt_texture.set_action(action)

func set_ingredient(ingredient : Ingredient):
	%IngredientTexture.texture = ingredient.base_texture
#endregion

#region Private functions
func _check_input(delta : float):
	if key_action.is_empty() or !enabled:
		return
	if Input.is_action_just_pressed(key_action):
		modulate = Color.GREEN
	if Input.is_action_just_released(key_action):
		modulate = Color.WHITE
		
#endregion

#region Subclasses
#endregion


