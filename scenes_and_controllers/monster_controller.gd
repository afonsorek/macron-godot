extends Node3D
class_name MonsterController

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
var current_monster : Monster
var satisfaction : int
@onready var view := %View as MonsterView
#endregion

#region Computed properties
var has_monster : bool :
	get: return current_monster != null
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
func set_monster(monster: Monster) -> void:
	view.show()
	current_monster = monster
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


