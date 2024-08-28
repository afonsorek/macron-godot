extends Node
class_name BaseController

#region Enums
#endregion

#region Parameters (consts and exportvars)
@onready var monster : MonsterController = %Monster
@export var monster_max_position := Vector3()
#endregion

#region Signals
#endregion

#region Variables
var monster_origin := Vector3()
var monster_proximity := 0
#endregion

#region Computed properties
var monster_move_step : Vector3:
	get:
		return (monster_max_position-monster_origin)/5.0
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	monster_origin = %Monster.position
	%WaitMusicPlayer.play()
	
func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	elif Input.is_action_just_pressed("action_down"):
		_move_monster(1)
	elif Input.is_action_just_pressed("action_up"):
		_move_monster(-1)
	elif Input.is_action_just_pressed("action_left"):
		_start_playtest()
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
#endregion

#region Private functions
func _move_monster(by := 0, start := false):
	monster_proximity += by;
	if monster_proximity < 0:
		%Ganhou.show()
	elif !start and (monster_proximity == 0 or monster_proximity == 4):
		%MainMusicPlayer.stop()
		%FastMusicPlayer.play()
		%AnimationPlayer.speed_scale *= 2
	elif monster_proximity >= 5:
		%Perdeu.show()
	monster_proximity = clamp(monster_proximity,0,5)
	var proximity_percent := monster_proximity/5.0
	monster.view.set_modulate(Color(proximity_percent,proximity_percent,proximity_percent))
	monster.position = monster_origin+monster_move_step*monster_proximity
	if monster_proximity <= 4 and by != 0:
		if by>0:
			%BadGroanPlayer.play()
		else:
			%GoodGroanPlayer.play()
	else:
		%LaughPlayer.play()
		
func _start_playtest():
	%LaughPlayer.play()
	%WaitMusicPlayer.stop()
	%MainMusicPlayer.play()
	%AnimationPlayer.play("background_pulse")
	monster.set_monster(Monster.new())
	monster.view.set_shaded(false)
	monster.view.set_billboard(true)
	_move_monster(0,true)
#endregion

#region Subclasses
#endregion


