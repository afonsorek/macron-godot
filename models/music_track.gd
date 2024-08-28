class_name MusicTrack
extends Resource

#region Enums
enum Note {C,Cs,D,Ds,E,F,Fs,G,Gs,A,As,B}
#endregion

#region Variables
@export var name : String
@export var audio_stream : AudioStream
@export var bpm : float
@export var head_note : Note
@export var time_signature : int
#endregion

#region Computed properties
#endregion

func _init():
	pass

#region Public functions
#endregion

#region Subclasses
#endregion


