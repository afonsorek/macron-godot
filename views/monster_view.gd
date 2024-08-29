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
	pass
	
func _process(_delta):
	super._process(_delta)
	
func _physics_process(_delta):
	pass
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

#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


