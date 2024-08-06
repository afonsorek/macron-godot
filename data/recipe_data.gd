class_name RecipeData

#region Enums
#endregion

#region Variables
static var recipes : Array[Recipe] = []
#endregion

#region Computed properties
#endregion

#region Public functions
static func initialize_recipes():
	var paths = FileUtility.get_resource_paths("res://data/recipes")
	for path in paths:
		var new_recipe : Recipe = load(path)
		if (new_recipe):
			recipes.append(new_recipe)
		else:
			print("Recipe null!!")
	

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


