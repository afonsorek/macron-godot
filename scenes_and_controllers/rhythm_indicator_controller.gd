extends Node3D
class_name RhythmIndicatorController

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var rhythm_bar_tscn : PackedScene = preload("res://scenes_and_controllers/rhythm_bar.tscn")
@export var bar_spawn_distance : float = 1.0
@export var notes_on_screen : float = 4.0
@export var fade_time := 0.25
@export var pulse_size := 1.5
@export var pulse_multiplier := 0.05
#endregion

#region Signals
#endregion

#region Variables
@onready var middle_bar : Sprite3D = %MiddleBar
var middle_bar_base_scale : Vector3
var middle_bar_tween : Tween
var speed_scale := 1.0
#endregion

#region Computed properties
var note_duration : float:
	get: return notes_on_screen/speed_scale
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	RhythmManager.bpm_changed.connect(_adjust_speed_scale)
	RhythmManager.beat.connect(_on_beat)
	RhythmManager.input_judged.connect(_on_rhythm_input)
	_adjust_speed_scale(RhythmManager.bpm)
	middle_bar_base_scale = middle_bar.scale
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
#endregion

#region Private functions
func _adjust_speed_scale(bpm:float):
	speed_scale = bpm/60.0
	
func _instantiate_bar() -> Sprite3D:
	var new_bar : Sprite3D = rhythm_bar_tscn.instantiate()
	add_child(new_bar)
	new_bar.modulate = Color.TRANSPARENT
	return new_bar

func _on_beat():
	var left_bar := _instantiate_bar()
	left_bar.position = Vector3(-bar_spawn_distance,0,0)
	_tween_bar(left_bar)
	var right_bar := _instantiate_bar()
	right_bar.position = Vector3(bar_spawn_distance,0,0)
	_tween_bar(right_bar)
	
func _on_rhythm_input(value : bool):
	if middle_bar_tween:
		middle_bar.scale = middle_bar_base_scale
		middle_bar_tween.kill()
	middle_bar_tween = get_tree().create_tween()
	# Começo
	middle_bar_tween.tween_property(middle_bar,"scale",middle_bar_base_scale*pulse_size,note_duration*pulse_multiplier)
	middle_bar_tween.parallel().tween_property(middle_bar,"modulate",Color.GREEN if value else Color.RED,note_duration*pulse_multiplier)
	# Fim
	middle_bar_tween.tween_property(middle_bar,"scale",middle_bar_base_scale,note_duration*pulse_multiplier)
	middle_bar_tween.parallel().tween_property(middle_bar,"modulate",Color.WHITE,note_duration*pulse_multiplier)
		
func _tween_bar(bar : Sprite3D):
	var tween = get_tree().create_tween()
	tween.tween_property(bar,"position", Vector3.ZERO, note_duration)
	tween.parallel().tween_property(bar,"modulate", Color.WHITE, note_duration/notes_on_screen)
	tween.tween_property(bar,"modulate", Color.TRANSPARENT, note_duration/notes_on_screen)
	tween.tween_callback(bar.queue_free)
	
#endregion

#region Subclasses
#endregion


