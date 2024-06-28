class_name IngredientData

#region Enums
#endregion

#region Variables
const ingredients : Array[Ingredient] = []
#endregion

#region Computed properties
#endregion

#region Public functions
static func get_ingredient_by_name(name : StringName) -> Ingredient:
	for ingredient in ingredients:
		if ingredient.name == name:
			return ingredient
	return null
#endregion

#region Subclasses
#endregion


