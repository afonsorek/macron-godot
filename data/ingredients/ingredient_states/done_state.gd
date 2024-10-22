class_name DoneState
extends IngredientState

#region Enums
#endregion

#region Variables
#endregion

#region Computed properties
#endregion

func _init():
	pass

#region Public functions
func enter(controller : IngredientController):
	controller.set_action_prompt("done")

func update(controller : IngredientController, delta : float):
	pass

func beat(controller : IngredientController):
	pass

func exit(controller : IngredientController):
	controller.set_action_prompt("")
#endregion

#region Subclasses
#endregion


