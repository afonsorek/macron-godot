extends Sprite3D
class_name RhythmBarController

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var light_color := Color("398aa5"):
	set(value):
		light_color = value
		if light:
			_update_light_color()
@export var light_on := true :
	set(value):
		light_on = value
		if light:
			_update_light_visiblity()
#endregion

#region Signals
#endregion

#region Variables
@onready var light : OmniLight3D = %Light
var max_energy : float
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	max_energy = light.light_energy
	_update_light_color()
	_update_light_visiblity()
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func hide_light(): light.hide()

func set_light_energy_factor(factor : float):
	light.light_energy = max_energy*factor
	
func show_light(): light.show()
#endregion

#region Private functions
func _update_light_color():
	light.light_color = light_color
	
func _update_light_visiblity():
	if light_on:
		show_light()
	else:
		hide_light()
#endregion

#region Subclasses
#endregion


