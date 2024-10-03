extends Node

#region Enums
enum CutType {DRY, WET, CRUNCH, SAW}
#endregion

#region Variables
@onready var dry_cutting_sounds = $DryCuttingSounds
@onready var wet_cutting_sounds = $WetCuttingSounds
@onready var crunch_cutting_sounds = $CrunchCuttingSounds
@onready var saw_cutting_sounds = $SawCuttingSounds
@onready var knife_in_sound = $KnifeIn
@onready var knife_out_sound = $KnifeOut
#endregion

#region Public functions
func play_cutting_sounds(cut_type : CutType):
	match cut_type:
		CutType.DRY:
			dry_cutting_sounds.play()
		CutType.WET:
			wet_cutting_sounds.play()
		CutType.CRUNCH:
			crunch_cutting_sounds.play()
		CutType.SAW:
			saw_cutting_sounds.play()
		_:
			dry_cutting_sounds.play()
#endregion
