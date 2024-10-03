extends Camera3D
class_name CameraController

enum Position {MAIN, CLOSER, SELECT_INGREDIENT}

@export var animation_speed = 0.4
@export var main_position = Vector3(0, 1.645, 3.044)
@export var main_rotation = Vector3(-0.101, 0, 0)
@export var closer_position = Vector3(0, 1.9, 1.6)
@export var closer_rotation = Vector3(-0.9, 0, 0)

func _ready():
	CameraManager.set_camera(self)
	
func move_view_to(cam_pos : Position):
	var goal_pos : Vector3
	var goal_rot : Vector3
	match cam_pos:
		Position.CLOSER:
			goal_pos = closer_position
			goal_rot = closer_rotation
		_:
			goal_pos = main_position
			goal_rot = main_rotation
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(self, "position", goal_pos, animation_speed).set_trans(Tween.TRANS_SINE)
	tween.parallel().tween_property(self, "rotation", goal_rot, animation_speed).set_trans(Tween.TRANS_SINE)
