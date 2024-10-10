extends Sprite3D
class_name RhythmBarController

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var light_color := Color("398aa5")
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
	light.light_color = light_color
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func hide_light(): light.hide()

func set_light_energy_factor(factor : float):
	light.light_energy = max_energy*factor
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


