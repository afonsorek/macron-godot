class_name RecipeData

#region Enums
#endregion

#region Variables
const recipes : Array[Recipe] = []
#endregion

#region Computed properties
#endregion

#region Public functions
static func match_recipe(ingredient_names : Array[StringName]) -> Recipe:
	ingredient_names.sort()
	for recipe in recipes:
		if ingredient_names == recipe.ingredients:
			return recipe
	return Recipe.new("Soup", ingredient_names)

static func get_recipes_with_ingredient(ingredient: Ingredient) -> Array[Recipe]:
	return get_recipes_with_ingredient_name(ingredient.name)
	
static func get_recipes_with_ingredient_name(name: StringName) -> Array[Recipe]:
	var result : Array[Recipe] = []
	for recipe in recipes:
		if recipe.ingredients.has(name):
			result.append(recipe)
	return result
	
#endregion

#region Subclasses
#endregion


