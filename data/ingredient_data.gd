class_name IngredientData

#region Enums
#endregion

#region Variables

static var ingredients : Array[Ingredient] = []
#endregion

#region Computed properties
#endregion

#region Public functions
static func initialize_ingredients():
	var paths = FileUtility.get_resource_paths("res://data/ingredients")
	for path in paths:
		var new_ingredient : Ingredient = load(path)
		if (new_ingredient):
			ingredients.append(new_ingredient)
		else:
			print("Ingredient null!!")

static func get_ingredient_by_name(name : StringName) -> Ingredient:
	if !ingredients:
		print("Ingredients not initialized!")
		return null
	for ingredient in ingredients:
		if ingredient.name == name:
			return ingredient
	print("No ingredient by name %s!" % name)
	return null
	
static func set_ingredient_as_known(name : StringName) -> void:
	var ingredient = get_ingredient_by_name(name)
	if ingredient:
		ingredient.known = true
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion



