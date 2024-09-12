class_name PotatoCutState
extends IngredientState

#region Enums
#endregion

#region Consts and exportvars
@export var total_cuts := 3
#endregion

#region Variables
var remaining_cuts : int
#endregion

#region Computed properties
#endregion

func _init():
	pass

#region Public functions
func enter(controller : IngredientController):
	controller.view.set_color(Color.CHARTREUSE)
	remaining_cuts = total_cuts
	controller.set_utensil(HandUtensilsView.Utensil.CLEAVER)

func update(controller : IngredientController, delta : float):
	if Input.is_action_just_pressed("action_right"):
		RhythmManager.judge_input()
		controller.view.squishy()
		remaining_cuts -= 1
		controller.view.splash.animate_splash()
		print("Cut! Remaining: %d" % remaining_cuts)
	if remaining_cuts <= 0:
		controller.transition("cut","done")

func beat(controller : IngredientController):
	pass

func exit(controller : IngredientController):
	controller.view.set_color(Color.RED)
#endregion

#region Subclasses
#endregion


