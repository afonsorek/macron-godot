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
@onready var middle_bar : RhythmBarController = %MiddleBar
@onready var bars_light : OmniLight3D = %BarsLight
var bar_count := 0.0:
	set(value):
		bar_count = value
		_update_lights_intensity(value)
var lights_base_energy : float
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
	_setup_lights()
	
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
	
func _instantiate_bar() -> RhythmBarController:
	var new_bar : RhythmBarController = rhythm_bar_tscn.instantiate()
	add_child(new_bar)
	new_bar.modulate = Color.TRANSPARENT
	return new_bar

func _on_beat():
	var left_bar := _instantiate_bar()
	left_bar.position = Vector3(-bar_spawn_distance,0,0)
	left_bar.set_light_energy_factor(0.0)
	_tween_bar(left_bar)
	var right_bar := _instantiate_bar()
	right_bar.position = Vector3(bar_spawn_distance,0,0)
	right_bar.set_light_energy_factor(0.0)
	_tween_bar(right_bar)
	bar_count += 1
	
func _on_rhythm_input(value : bool, _animate : bool):
	if middle_bar_tween:
		middle_bar.scale = middle_bar_base_scale
		middle_bar_tween.kill()
	middle_bar_tween = get_tree().create_tween()
	# Começo
	middle_bar.show_light()
	var pulse_duration = note_duration*pulse_multiplier
	middle_bar_tween.tween_property(middle_bar,"scale",middle_bar_base_scale*pulse_size,pulse_duration)
	middle_bar_tween.parallel().tween_property(middle_bar,"modulate",Color.GREEN if value else Color.RED,pulse_duration)
	middle_bar_tween.parallel().tween_property(middle_bar,"light_color",Color.GREEN if value else Color.RED,pulse_duration)
	middle_bar_tween.parallel().tween_method(middle_bar.set_light_energy_factor,0.0,1.0,pulse_duration)
	# Fim
	middle_bar_tween.tween_property(middle_bar,"scale",middle_bar_base_scale,pulse_duration)
	middle_bar_tween.parallel().tween_property(middle_bar,"modulate",Color.WHITE,pulse_duration)
	middle_bar_tween.parallel().tween_property(middle_bar,"light_color",Color.WHITE,pulse_duration)
	middle_bar_tween.parallel().tween_method(middle_bar.set_light_energy_factor,1.0,0.0,pulse_duration)
		
func _tween_bar(bar : RhythmBarController):
	var beat_duration := note_duration/notes_on_screen
	var callback := func():
		bar.queue_free()
		bar_count -= 0.5
	var tween = get_tree().create_tween()
	tween.tween_property(bar,"position", Vector3.ZERO, note_duration)
	tween.parallel().tween_property(bar,"modulate", Color.WHITE, beat_duration)
	tween.parallel().tween_method(bar.set_light_energy_factor,0.0,1.0,beat_duration)
	tween.tween_property(bar,"modulate", Color.TRANSPARENT, beat_duration)
	tween.parallel().tween_method(bar.set_light_energy_factor,1.0,0.0,beat_duration)
	tween.tween_callback(callback)
	
func _setup_lights():
	lights_base_energy = bars_light.light_energy
	bars_light.light_energy = 0.0
	
func _update_lights_intensity(new_value:int):
	var factor := new_value/notes_on_screen
	var energy = factor*lights_base_energy
	var light_tween = get_tree().create_tween()
	light_tween.tween_property(bars_light,"light_energy",energy,note_duration)
	
#endregion

#region Subclasses
#endregion


