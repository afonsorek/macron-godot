extends PivotableView
class_name MonsterView

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var max_monster_position := -150
@export var monster_proximity_curve : Curve
#endregion

#region Signals
#endregion

#region Variables
@onready var animation_player : AnimationPlayer = %AnimationPlayer
@onready var sprite : FixedSizeSprite3D = %MainSprite
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	RhythmManager.bpm_changed.connect(_adjust_speed_scale)
	_adjust_speed_scale(RhythmManager.bpm)
	
func _process(_delta):
	super._process(_delta)
	
func _physics_process(_delta):
	pass
	
func _adjust_speed_scale(bpm:float):
	animation_player.speed_scale = bpm/60.0
#endregion

#region Public functions
func set_billboard(value : bool):
	sprite.billboard = 1 if value else 0
	
func set_modulate(color : Color):
	sprite.modulate = color
	
func set_shaded(value : bool):
	sprite.shaded = value

func entry():
	show()
	animation_player.play("monster-entry")
	await animation_player.animation_finished
	animation_player.play("monster_idle")

func move_monster_to(new_z_pos: float, instant := false):
	var new_pos := Vector3(0, 0, new_z_pos)
	if instant:
		sprite.position = new_pos
		return
	if animation_player.current_animation != "monster_idle":
		return
	animation_player.play("monster_jump")
	var movement_tween = get_tree().create_tween()
	movement_tween.tween_property(sprite, "position", new_pos, 1)
	await animation_player.animation_finished
	animation_player.play("monster_idle")
	
func set_monster_position_relative(satisfaction : float, max_satisfaction : float, instant := false):
	var new_z_pos := monster_proximity_curve.sample(satisfaction/max_satisfaction)*max_monster_position
	move_monster_to(new_z_pos, instant)
	
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


