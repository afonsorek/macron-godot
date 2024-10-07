extends PivotableView
class_name SplashView

@export var animation_speed = 0.3
@export var smaller_size := 1.25
@export var bigger_size := 2.5

@onready var sprite : Sprite3D = %Sprite
	
func animate_splash():
	_set_random_rotation()
	show()
	sprite.scale = Vector3.ZERO
	var tween : Tween = get_tree().create_tween()
	var random_scale = randf_range(smaller_size,bigger_size)
	tween.tween_property(sprite, "scale", Vector3(random_scale,random_scale,random_scale), animation_speed).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(hide)
	
func set_modulate(new_color : Color):
	sprite.modulate = new_color
	
func _set_random_rotation():
	sprite.rotation = Vector3(0.0,0.0,randf_range(0.0,2*PI))
