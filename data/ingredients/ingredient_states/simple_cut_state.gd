class_name SimpleCutState
extends IngredientState

#region Enums
#endregion

#region Consts and exportvars
@export var action_sequence : Array[String] = []
@export var repetitions : int
#endregion

#region Variables
var remaining_repetitions : int
var sequence_position := 0
#endregion

#region Computed properties
#endregion

func _init():
	pass

#region Public functions
func enter(controller : IngredientController):
	#controller.view.set_color(Color.CHARTREUSE)
	#_initialize_action_sequence()
	sequence_position = 0
	remaining_repetitions = repetitions
	controller.set_utensil(Global.Utensil.CLEAVER)
	#_set_current_action_prompt(controller)
	#controller.set_action_prompt(action_sequence[0])
	controller.set_action_sequence(action_sequence,repetitions)

func update(controller : IngredientController, delta : float):
	if !controller.allow_inputs:
		return
	var next_input = action_sequence[sequence_position]
	var miss_inputs = InputManager.get_miss_inputs([next_input])
	for miss_input in miss_inputs:
		if Input.is_action_just_pressed(miss_input):
			RhythmManager.miss()
			return
	if Input.is_action_just_pressed(next_input):
		RhythmManager.judge_input()
		SoundManager.play_cutting_sounds(SoundManager.CutType.WET)
		controller.view.squishy()
		controller.view.splash.animate_splash()
		sequence_position += 1
		#_set_current_action_prompt(controller)
	if sequence_position >= action_sequence.size():
		remaining_repetitions -= 1
		print(remaining_repetitions)
		if remaining_repetitions > 0:
			sequence_position = 0
		else:
			controller.transition(name,"done")

func beat(controller : IngredientController):
	pass

func exit(controller : IngredientController):
	#controller.set_action_prompt("")
	controller.set_action_sequence([],0)
#endregion

#region Private functions
#func _initialize_action_sequence():
	#action_sequence = []
		#
#func _set_current_action_prompt(controller : IngredientController):
	#if sequence_position >= 0 and sequence_position < action_sequence.size():
		#controller.set_action_prompt(action_sequence[sequence_position])
#endregion

#region Subclasses
#endregion


