extends Sprite3D
class_name SplashView

@export var animation_speed = 0.3
@export var bigger_size = Vector3(2.5, 2.5, 2.5)
	
func animate_splash():
	show()
	scale = Vector3.ZERO
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(self, "scale", bigger_size, animation_speed).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(func(): hide())
