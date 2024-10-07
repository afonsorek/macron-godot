extends PivotableView
class_name MonsterView

#region Enums
#endregion

#region Parameters (consts and exportvars)
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
	RhythmManager.bpm_changed.connect(_adjust_speed_scale)
	_adjust_speed_scale(RhythmManager.bpm)
	
func _process(_delta):
	super._process(_delta)
	
func _physics_process(_delta):
	pass
	
func _adjust_speed_scale(bpm:float):
	%AnimationPlayer.speed_scale = bpm/60.0
#endregion

#region Public functions
func set_billboard(value : bool):
	%MainSprite.billboard = 1 if value else 0
	
func set_modulate(color : Color):
	%MainSprite.modulate = color
	
func set_shaded(value : bool):
	%MainSprite.shaded = value

func entry():
	show()
	%AnimationPlayer.play("monster-entry")
	await %AnimationPlayer.animation_finished
	%AnimationPlayer.play("monster_idle")

func move_monster_to(position: float):
	%AnimationPlayer.play("monster_jump")
	var movement_tween = get_tree().create_tween()
	movement_tween.tween_property(%Pivot/MainSprite, "position", Vector3(0, 0, position), 1)
	await %AnimationPlayer.animation_finished
	%AnimationPlayer.play("monster_idle")
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


