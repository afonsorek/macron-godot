class_name PotatoCutState
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
	controller.view.set_color(Color.CHARTREUSE)
	controller.state_properties["remaining_cuts"] = 4
	print("Entrei aqui ebaa")

func update(controller : IngredientController, delta : float):
	if Input.is_action_just_pressed("action_right"):
		#play animation of cuting
		#controller.view.cut()
		RhythmManager.judge_input()
		controller.view.squishy()
		controller.state_properties["remaining_cuts"] -= 1
		print("Cut! Remaining: %d" % controller.state_properties["remaining_cuts"])
	if controller.state_properties["remaining_cuts"] <= 0:
		controller.transition("cut","done")

func beat(controller : IngredientController):
	pass

func exit(controller : IngredientController):
	controller.view.set_color(Color.RED)
#endregion

#region Subclasses
#endregion


