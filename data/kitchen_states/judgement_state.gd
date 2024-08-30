extends KitchenState
class_name JudgementState

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
	controller.camera.move_view_to(CameraController.Position.MAIN)
	controller.monster_controller.receive_recipe(controller.made_recipe)
	await controller.get_tree().create_timer(2.0).timeout
	controller.transition_state(name,"select_ingredient")
	
func update(controller : KitchenController, delta : float):
	pass

func beat(controller : KitchenController):
	pass

func exit(controller : KitchenController):
	pass
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


