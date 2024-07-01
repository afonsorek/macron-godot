class_name Ingredient

#region Enums
#endregion

#region Variables
## StringNames são strings únicas no código: ótimas para relacionar dados,
## funcionando efetivamente como UUIDs.
var name : StringName
var description : String
var elements : Dictionary # StringName -> int
var states : Array[IngredientState]
var known : bool = false
#endregion

#region Computed properties
#endregion

func _init(name: StringName, description: String, elements: Dictionary, states: Array[IngredientState]):
	self.name = name
	self.description = description
	self.elements = elements
	self.states = states

#region Public functions
#endregion

#region Subclasses
#endregion


