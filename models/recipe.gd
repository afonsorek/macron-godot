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
func get_elements() -> Array[StringName]:
	var ings : Array[Ingredient] = []
	for ingredient_name in ingredients:
		var ing = IngredientData.get_ingredient_by_name(ingredient_name)
		if ing:
			ings.append(ing)
	var elements : Array[StringName] = []
	for ing in ings:
		elements.append_array(ing.elements)
	return elements
#endregion

#region Subclasses
#endregion


