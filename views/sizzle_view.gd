extends PivotableView
class_name SizzleView

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
	%AnimationPlayer.play("idle")
	RhythmManager.bpm_changed.connect(_adjust_speed_scale)
	_adjust_speed_scale(RhythmManager.bpm)
	
func _process(_delta):
	super._process(_delta)
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func say(text: String):
	pass
#endregion

#region Private functions
func _adjust_speed_scale(bpm:float):
	%AnimationPlayer.speed_scale = bpm/60.0
#endregion

#region Subclasses
#endregion


