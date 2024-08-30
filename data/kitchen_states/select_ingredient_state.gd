extends KitchenState
class_name SelectIngredientState

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
#endregion

#region Computed properties
#endregion

#region Public functions
func enter(controller : KitchenController):
	controller.camera.move_view_to(CameraController.Position.SELECT_INGREDIENT)
	controller.ui_view.show_select_ingredient()
	
func update(controller : KitchenController, delta : float):
	if Input.is_action_just_pressed("action_up"):
		RhythmManager.judge_input()
		controller.selected_ingredient_names = ["Potato","Potato","Potato"]
		controller.transition_state(name,"cooking")

func beat(controller : KitchenController):
	pass

func exit(controller : KitchenController):
	controller.ui_view.hide_select_ingredient()
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


