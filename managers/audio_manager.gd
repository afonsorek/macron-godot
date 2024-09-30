extends Node
class_name AudioManagerSFX

@onready var dry_cut_1 = $DryCut1
@onready var dry_cut_2 = load("res://assets/sfx/cutting_sounds/cut-dry-2.wav")
@onready var dry_cut_3 = load("res://assets/sfx/cutting_sounds/cut-dry-3.wav")

var player : AudioStreamPlayer

	
	
func play_dry_cutting():
	dry_cut_1.play()
