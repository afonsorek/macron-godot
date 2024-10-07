extends Node3D
class_name PivotableView

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var look_at_camera := true
@onready var pivot : Node3D = %Pivot
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
	pass
	
func _process(_delta):
	if visible and look_at_camera:
		_look_at_camera()
	
func _physics_process(_delta):
	pass
#endregion

#region Tool functions
func _get_configuration_warnings():
	var pivot_node := get_node("Pivot")
	if !pivot_node or !(pivot_node is Node3D):
		return ["PivotableView must have a Node3D \"Pivot\" child."]
	return []
#endregion

#region Public functions
#endregion

#region Private functions
func _look_at_camera():
	var cam = CameraManager.camera
	pivot.look_at(cam.position,Vector3.UP,true)
#endregion

#region Subclasses
#endregion


