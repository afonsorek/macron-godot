class_name Monster

#region Enums
var hunger_levels : Dictionary = {
	1: "Nibbler",
	2: "Hungry",
	3: "Insatiable",
	4: "Devourer",
	5: "Ravenous"
}
var aggressiveness_levels : Dictionary = {
	1: "Calm",
	2: "Opportunistic",
	3: "Aggressive",
	4: "Furious",
	5: "Berserker"
}
var impatience_levels : Dictionary = {
	1: "Patient",
	2: "Impatient",
	3: "Immediatist",
	4: "Hothead",
	5: "Zero Tolerance"
}
#endregion

#region Variables
var name : StringName
var descriptions : Array[String]
var hunger : int
var aggressiveness : int
var impatience : int
var tastes : Dictionary # String -> bool, true se gosta e false se desgosta
var enter : Callable # (controller : MonsterController) -> void
var update : Callable # (controller : MonsterController, delta : float) -> void
var beat : Callable # (controller : MonsterController) -> void
var exit : Callable # (controller : MonsterController) -> void
var tips : Array[String]

#endregion

#region Computed properties
var max_satisfaction : int:
	get: return 30+hunger*10
var satisfaction_damage : int:
	get: return 2*aggressiveness
var waiting_beats : int:
	get: return (6-impatience)*4
#endregion

func _init():
	pass

#region Public functions
func get_hunger_level(hunger: int) -> String:
	return hunger_levels[hunger]
#endregion

#region Subclasses
#endregion


