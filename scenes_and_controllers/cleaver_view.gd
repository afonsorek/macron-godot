extends Control
class_name CleaverView

var is_closer := false

func use_animation():
	%NeutralCleaver.hide()
	%SmearCleaver.show()
	await get_tree().create_timer(0.03).timeout
	%SmearCleaver.hide()
	%CuttingCleaver.show()
	SoundManager.play_cutting_sounds(SoundManager.CutType.WET)
	await get_tree().create_timer(0.1).timeout
	%NeutralCleaver.show()
	%CuttingCleaver.hide()
	
	
func enter_animation():
	if !is_closer:
		%NeutralCleaver.move_closer()
		SoundManager.knife_in_sound.play()
		is_closer = true

func exit_animation():
	if is_closer:
		%NeutralCleaver.move_farder()
		SoundManager.knife_out_sound.play()
		is_closer = false
