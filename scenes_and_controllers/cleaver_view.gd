extends Control

class_name CleaverClass

func cleaver_animation():
	%NeutralCleaver.hide()
	%CuttingCleaver.show()
	await get_tree().create_timer(0.1).timeout
	%NeutralCleaver.show()
	%CuttingCleaver.hide()
	
