class_name RecipeData

#region Enums
#endregion

#region Variables
static var recipes : Array[Recipe] = []
#endregion

#region Computed properties
#endregion

#region Public functions
static func init_recipes():
	recipes = []
	for i in range(0):
		var nr = Recipe.new()
		match i:
			_:
				nr.name = "nil"

static func match_recipe(ingredient_names : Array[StringName]) -> Recipe:
	ingredient_names.sort()
	for recipe in recipes:
		if ingredient_names == recipe.ingredients:
			return recipe
	# If specific recipe not found:
	var default_recipe = Recipe.new()
	default_recipe.name = "Soup"
	default_recipe.ingredients = ingredient_names
	return default_recipe

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


