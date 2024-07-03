class_name Ingredient

#region Enums
#endregion

#region Variables
## StringNames são strings únicas no código: ótimas para relacionar dados,
## funcionando efetivamente como UUIDs.
var name : StringName
var description : String
var elements : Array[StringName]
var states : Array[IngredientState]
var known : bool = false
#endregion

#region Computed properties
#endregion

func _init(_name: StringName, _description: String, _elements: Array[StringName], _states: Array[IngredientState]):
	name = _name
	description = _description
	elements = _elements
	states = _states

#region Public functions
#endregion

#region Subclasses
#endregion


