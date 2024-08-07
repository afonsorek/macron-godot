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

#region Computed properties
#endregion

#Processando
func cut():
	var slices = []
	for i in 4:
		var sprite = $Sprite.duplicate()
		slices.append(sprite)
		
		sprite.
		
		self.add_child(sprite)
		
	
	$ingredient_animation.play("ingredient_cut")

#Entrada
func entry():
	show()
	$ingredient_animation.speed_scale *= 2.0
	$ingredient_animation.play("ingredient_entry")
	$ingredient_animation.speed_scale /= 2.0 

#Saida

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


