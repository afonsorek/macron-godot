class_name IngredientData

#region Enums
#endregion

#region Variables
static var ingredients : Array[Ingredient]
#endregion

#region Computed properties
#endregion

#region Public functions
static func initialize_ingredients():
	ingredients = []
	for i in range(1):
		var ni := Ingredient.new()
		match i:
			0:
				ni.name = "batata"
				ni.description = "eh uma batata"
				ni.elements = ["Carb"]
				var cut_state = IngredientState.new()
				cut_state.name = "cut"
				cut_state.enter = func(controller : IngredientController) -> void: # Enter
					controller.view.set_color(Color.CHARTREUSE)
					controller.state_properties["remaining_cuts"] = 4
					print("Entered cut state!")
				cut_state.update = func(controller: IngredientController, delta: float) -> void: # Update
					if Input.is_action_just_pressed("action_right"):
						controller.state_properties["remaining_cuts"] -= 1
						print("Cut! Remaining: %d" % controller.state_properties["remaining_cuts"])
					if controller.state_properties["remaining_cuts"] <= 0:
						controller.transition("cut","done")
				cut_state.exit = func(controller : IngredientController) -> void: #Exit
					controller.view.set_color(Color.RED)
					print("Exited cut state!")
				var done_state = IngredientState.new()
				done_state.name = "done"
				done_state.enter = func(controller: IngredientController):
					controller.view.set_color(Color.RED)
					print("Entered done state!")
				ni.states = [cut_state, done_state]
		ingredients.append(ni)

static func get_ingredient_by_name(name : StringName) -> Ingredient:
	if !ingredients:
		print("Ingredients not initialized!")
		return null
	for ingredient in ingredients:
		if ingredient.name == name:
			return ingredient
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



