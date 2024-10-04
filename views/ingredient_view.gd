extends PivotableView
class_name IngredientView

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var base_sprite_size := 1024.0
#endregion

#region Signals
#endregion

#region Variables
@onready var splash := %Splash as SplashView
#endregion

#Processando
func squishy():
	%IngredientAnimation.stop(true)
	%IngredientAnimation.play("ingredient_squishy")

#Entrada
func entry():
	%IngredientAnimation.play("ingredient_entry")

#Saida
func send():
	%IngredientAnimation.play("ingredient_send")

#Descarte

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	RhythmManager.bpm_changed.connect(_adjust_speed_scale)
	%IngredientAnimation.animation_finished.connect(_on_animation_finished)
	_adjust_speed_scale(RhythmManager.bpm)
	
func _process(_delta):
	super._process(_delta)
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func set_color(color: Color):
	%Sprite.modulate = color
#endregion

#region Private functions
func _adjust_speed_scale(bpm:float):
	%IngredientAnimation.speed_scale = bpm/60.0
	
func _on_animation_finished(anim_name:String):
	if anim_name == "ingredient_send":
		queue_free()
#endregion

#region Subclasses
#endregion


