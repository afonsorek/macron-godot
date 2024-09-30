extends Node
class_name AudioManagerSFX

@onready var dry_cutting_sounds = $DryCuttingSounds

var player : AudioStreamPlayer

	
	
func play_dry_cutting():
	dry_cutting_sounds.play()
