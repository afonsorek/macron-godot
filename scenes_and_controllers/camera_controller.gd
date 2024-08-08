extends Camera3D
class_name CameraController

@export var animation_speed = 0.4
@export var farder_position = Vector3(0, 1.705, 3.04)
@export var farder_rotation = Vector3(-0.16, 0, 0)
@export var closer_position = Vector3(0, 1.9, 1.5)
@export var closer_rotation = Vector3(-0.9, 0, 0)

func _move_view_closer():
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(self, "position", closer_position, animation_speed).set_trans(Tween.TRANS_SINE)
	tween.parallel().tween_property(self, "rotation", closer_rotation, animation_speed).set_trans(Tween.TRANS_SINE)
	
func _move_view_farder():
	var tween2 : Tween = get_tree().create_tween()
	tween2.tween_property(self, "position", farder_position, animation_speed).set_trans(Tween.TRANS_SINE)
	tween2.parallel().tween_property(self, "rotation", farder_rotation, animation_speed).set_trans(Tween.TRANS_SINE)
