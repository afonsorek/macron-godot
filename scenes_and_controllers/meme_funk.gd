extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	%AnimationPlayer.play("animacao-meme-sapao")
	RhythmManager.set_track(load("res://assets/pancadao-do-sapao.tres"),true,true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
