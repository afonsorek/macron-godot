extends KitchenState
class_name SelectIngredientState

#region Enums
#endregion

#region Parameters (consts and exportvars)
var action_order := ["action_up", "action_right", "action_left", "action_down"]
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
	for i in range(action_order.size()):
		if i >= GameManager.ingredients.size():
			break
		if Input.is_action_just_pressed(action_order[i]):
			controller.add_selected_ingredient(GameManager.ingredients[i])
	if Input.is_action_just_pressed("done"):
		if controller.is_selected_ingredients_full:
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


