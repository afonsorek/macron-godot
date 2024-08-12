extends Node3D
class_name IngredientView

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
#endregion

#Processando
func squishy():
	$ingredient_animation.play("ingredient_squishy")

#Entrada
func entry():
	show()
	$ingredient_animation.speed_scale *= 2.0
	$ingredient_animation.play("ingredient_entry")
	$ingredient_animation.speed_scale /= 2.0 

#Saida
func send():
	$ingredient_animation.play("ingredient_send")
	OS.delay_msec(0.5)

#Descarte

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	entry()
	pass
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func set_color(color: Color):
	%Sprite.modulate = color
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


