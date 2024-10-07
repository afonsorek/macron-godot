extends PivotableView
class_name IngredientView

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var base_sprite_size := 1024.0
#endregion

#region Signals
signal ingredient_entered()
#endregion

#region Variables
@onready var animation := %IngredientAnimation as AnimationPlayer
@onready var splash := %Splash as SplashView
@onready var sprite := %Sprite as FixedSizeSprite3D
#endregion

#Processando
func squishy():
	animation.stop(true)
	animation.play("ingredient_squishy")

#Entrada
func entry():
	animation.play("ingredient_entry")
	await animation.animation_finished
	ingredient_entered.emit()

#Saida
func send():
	animation.play("ingredient_send")

#Descarte

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	RhythmManager.bpm_changed.connect(_adjust_speed_scale)
	animation.animation_finished.connect(_on_animation_finished)
	_adjust_speed_scale(RhythmManager.bpm)
	
func _process(_delta):
	super._process(_delta)
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func set_ingredient(ingredient: Ingredient):
	sprite.set_texture_resize(ingredient.base_texture)
	splash.set_modulate(ingredient.splash_color)
	
func set_color(color: Color):
	sprite.modulate = color
#endregion

#region Private functions
func _adjust_speed_scale(bpm:float):
	animation.speed_scale = bpm/60.0
	
func _on_animation_finished(anim_name:String):
	if anim_name == "ingredient_send":
		queue_free()
#endregion

#region Subclasses
#endregion


