extends Node

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
var camera : Camera3D
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
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func get_camera() -> Camera3D:
	return camera
	
func get_camera_position() -> Vector3:
	return camera.position
	
func set_camera(cam : Camera3D):
	camera = cam
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


