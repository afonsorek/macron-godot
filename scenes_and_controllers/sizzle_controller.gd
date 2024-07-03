extends Node3D
class_name SizzleController

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
@onready var view := %View as SizzleView
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
func give_tip(possible_tips: Array[String]):
	if !possible_tips.is_empty():
		var selected_tip = possible_tips.pick_random()
		view.say(selected_tip)
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


