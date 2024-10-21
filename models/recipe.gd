class_name Recipe
extends Resource

#region Enums
#endregion

#region Variables
var name: StringName
var ingredients: Array[StringName]:
	set(value):
		value.sort()
		ingredients = value
var known : bool = false
#endregion

#region Computed properties
#endregion

#region Public functions
func is_same_recipe(other : Recipe) -> bool:
	ingredients.sort()
	other.ingredients.sort()
	for idx in ingredients.size():
		if ingredients[idx] != other.ingredients[idx]:
			return false
	return true
	
func get_elements() -> Array[Global.Element]:
	var ings : Array[Ingredient] = []
	for ingredient_name in ingredients:
		var ing = IngredientData.get_ingredient_by_name(ingredient_name)
		if ing:
			ings.append(ing)
	var elements : Array[Global.Element] = []
	for ing in ings:
		elements.append_array(ing.elements)
	return elements
#endregion

#region Subclasses
#endregion


