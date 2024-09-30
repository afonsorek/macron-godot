extends Node

@onready var dry_cutting_sounds = $WetCuttingSounds

func play_dry_cutting():
	dry_cutting_sounds.play()
