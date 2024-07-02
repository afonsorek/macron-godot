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

#Entrada
func entry():
	var animation = Animation.new()
	var track_index = animation.add_track(Animation.TYPE_VALUE)
	animation.track_set_path(track_index, "Ingredient:position:x")
	animation.track_insert_key(track_index, 0.0, 0)
	animation.track_insert_key(track_index, 2.0, 100)
	animation.length = 2.0

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


