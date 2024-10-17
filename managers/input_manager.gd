extends Node

#region Enums
#endregion

#region Parameters (consts and exportvars)
const excluded_actions : Array[StringName] = ["reset","mute"]
#endregion

#region Signals
#endregion

#region Variables
var rhythm_inputs : Array[StringName] = []
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	_get_rhythm_inputs()
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func get_miss_inputs(right_inputs : Array[StringName]):
	return rhythm_inputs.filter(func(action): return !(action in right_inputs))
#endregion

#region Private functions
func _get_rhythm_inputs():
	var result := InputMap.get_actions()
	result = result.filter(func(action): return !action.begins_with("ui_"))
	result = result.filter(func(action): return !(action in excluded_actions))
	rhythm_inputs = result
#endregion

#region Subclasses
#endregion


