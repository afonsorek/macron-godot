class_name Recipe

#region Enums
#endregion

#region Variables
var name: StringName
var ingredients: Array[StringName]
var known : bool = false
#endregion

#region Computed properties
#endregion

func _init(name: StringName, ingredients: Array[StringName]):
	self.name = name
	self.ingredients = ingredients
	self.ingredients.sort()
	pass

#region Public functions
#endregion

#region Subclasses
#endregion


