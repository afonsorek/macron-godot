extends Node

#region Enums
#enum InputScore {MISS,BAD,GOOD,GREAT,PERFECT}
#endregion

#region Parameters (consts and exportvars)
const TOLERANCE = 0.2
#endregion

#region Signals
signal beat()
signal bpm_changed(bpm : float)
signal changed_measure()
signal input_judged(result : bool)
signal rhythm_input(action : String)
signal started_playing(track : MusicTrack)
signal stopped_playing()
#endregion

#region Variables
var audio_bus_index : int
var bpm := 60.0
var current_track : MusicTrack
var delay_input := 0.0
var delay_output := 0.0
var is_playing := false
var muted := false
var player : AudioStreamPlayer
var timer : Timer
var total_beat_count : int
var used_last_beat := false
var used_this_beat := false
#endregion

#region Computed properties
var current_beat : int:
	get: return total_beat_count % (current_track.time_signature if current_track else 1)
var beat_time : float:
	get: return 1.0/(bpm/60.0)
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	_init_timer()
	_init_player()
	# Testes
	set_track(load("res://data/music_tracks/test_track.tres"),true,true)
	delay_input = 0.1
	#set_bpm(100*1.25)
	
func _process(_delta):
	if Input.is_action_just_pressed("mute"):
		_mute_action()
	# Teste
	#if Input.is_action_just_pressed("action_down"):
		#print(judge_input())
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func chain_track(track: MusicTrack):
	await changed_measure
	set_track(track,true,true)
	
func judge_input() -> bool:
	var delayed_input := timer.time_left + delay_input
	var time := (delayed_input)/beat_time
	var hit_last_beat := (1.0-time) < TOLERANCE and !used_last_beat
	var hit_this_beat := time < TOLERANCE and !used_this_beat
	if hit_last_beat:
		used_last_beat = true
	if hit_this_beat:
		used_this_beat = true
	#print("%.2f / %.2f = %.2f" % [delayed_input, beat_time, time])
	var result = hit_last_beat or hit_this_beat
	input_judged.emit(result)
	return result
	
func play():
	if !current_track:
		return
	_reset_total_beat_count()
	is_playing = true
	player.play()
	var play_delay = AudioServer.get_time_to_next_mix()+AudioServer.get_output_latency()
	await get_tree().create_timer(play_delay).timeout
	timer.start()
	started_playing.emit(current_track)
	
func set_bpm(new_bpm : float):
	bpm = new_bpm
	timer.wait_time = beat_time
	bpm_changed.emit(bpm)
	if is_playing and current_track:
		_adjust_pitch_scale()
	
func set_track(track: MusicTrack, change_bpm := true, play_on_change := false):
	current_track = track
	stop()
	player.stream = current_track.audio_stream
	if change_bpm:
		set_bpm(current_track.bpm)
	_adjust_pitch_scale()
	if play_on_change:
		play()
	
func stop():
	timer.stop()
	stopped_playing.emit()
	is_playing = false
	if player.playing:
		player.stop()
#endregion

#region Private functions
func _adjust_pitch_scale():
	if !player or !current_track:
		return
	player.pitch_scale = bpm/current_track.bpm
	
func _init_player():
	player = AudioStreamPlayer.new()
	player.bus = "Music"
	#player.finished.connect(_player_finished)
	add_child(player)
	audio_bus_index = AudioServer.get_bus_index("Music")
	
func _init_timer():
	timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	
func _mute_action():
	muted = !muted
	AudioServer.set_bus_mute(audio_bus_index,muted)
	
func _on_timer_timeout():
	total_beat_count += 1
	beat.emit()
	used_last_beat = used_this_beat
	used_this_beat = false
	if current_beat == 0:
		changed_measure.emit()
	
func _reset_total_beat_count():
	total_beat_count = 0
#endregion

#region Subclasses
#endregion


