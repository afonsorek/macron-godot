extends KitchenState
class_name JumpscareState

#region Public functions
func enter(controller : KitchenController):	
	controller.camera.move_view_to(CameraController.Position.MAIN)
	controller.hand_utensils.remove_utensil()
	controller.hide_ui()
	SoundManager.play_monster_reaction_sound(SoundManager.MonsterReaction.LAUGH)
	await controller.get_tree().create_timer(2.0).timeout
	
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


