class_name OnionCutState
extends SimpleCutState

#region Enums
#endregion

#region Consts and exportvars
#endregion

#region Variables
#endregion

#region Computed properties
#endregion

#region Public functions
#endregion

#region Private functions
func _initialize_action_sequence():
	action_sequence = []
	for i in range(4):
		action_sequence.append("action_down")
		action_sequence.append("action_right")
#endregion

#region Subclasses
#endregion


