extends KitchenState
class_name MonsterEnterState

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var wait_beats := 8
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
	var wait_time := RhythmManager.beat_time * wait_beats
	await controller.get_tree().create_timer(wait_time).timeout
	if !controller:
		return
	_spawn_monster(controller)
	await controller.get_tree().create_timer(wait_time).timeout
	if !controller:
		return
	controller.transition_state(name,"select_ingredient")
	
func update(controller : KitchenController, delta : float):
	pass

func beat(controller : KitchenController):
	pass

func exit(controller : KitchenController):
	pass
#endregion

#region Private functions
func _spawn_monster(controller : KitchenController):
	var selected_monster = MonsterData.get_random_monster()
	controller.monster_controller.set_monster(selected_monster)
	controller.sizzle_controller.give_tip(selected_monster.tips)
#endregion

#region Subclasses
#endregion


