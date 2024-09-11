extends Sprite2D

@export var animation_speed = 0.4
@export var farder_position = Vector2(1736, 1414)
@export var farder_size = Vector2(0.35, 0.35)
@export var closer_position = Vector2(1563, 624)
@export var closer_size = Vector2(0.541, 0.541)

func _move_closer():
	show()
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", closer_position, animation_speed).set_trans(Tween.TRANS_SINE)
	tween.parallel().tween_property(self, "scale", closer_size, animation_speed).set_trans(Tween.TRANS_SINE)
	
func _move_farder():
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", farder_position, animation_speed).set_trans(Tween.TRANS_SINE)
	tween.parallel().tween_property(self, "scale", farder_size, animation_speed).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(func(): hide())
