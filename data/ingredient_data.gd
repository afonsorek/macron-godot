class_name IngredientData

#region Enums
#endregion

#region Variables
#endregion

#region Computed properties
#endregion

#region Public functions
static func get_ingredients() -> Array[Ingredient]:
	return [
		Ingredient.new(
			"batata",
			"eh uma batata",
			{ "Carb": 1 },
			[
				IngredientState.new(
					"cut",
					func(controller : IngredientController): # Enter
						controller.view.set_color(Color.CHARTREUSE)
						controller.state_properties["remaining_cuts"] = 4
						print("Entered cut state!"),
					func(controller: IngredientController, delta: float): # Update
						if Input.is_action_just_pressed("B"):
							controller.state_properties["remaining_cuts"] -= 1
							print("Cut! Remaining: %d" % controller.state_properties["remaining_cuts"])
						if controller.state_properties["remaining_cuts"] <= 0:
							controller.transition("cut","done"),
					Callable(), #Beat,
					func(controller : IngredientController): #Exit
						controller.view.set_color(Color.RED)
						print("Exited cut state!"),
				),
				IngredientState.new(
					"done",
					func(controller : IngredientController):
						print("Entered done state!"),
				)
			]
		)
	]

static func get_ingredient_by_name(name : StringName) -> Ingredient:
	for ingredient in get_ingredients():
		if ingredient.name == name:
			return ingredient
	return null
#endregion

#region Subclasses
#endregion


