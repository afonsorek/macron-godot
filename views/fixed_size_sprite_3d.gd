extends Sprite3D
class_name FixedSizeSprite3D

#region Enums
enum FixedType {FIXED_WIDTH, FIXED_HEIGHT}
#endregion

#region Parameters (consts and exportvars)
@export var base_size_px := Vector2.ZERO
@export var fixed_type := FixedType.FIXED_WIDTH
#endregion

#region Signals
#endregion

#region Variables
var base_pixel_size : float
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	base_pixel_size = pixel_size
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func set_texture_resize(new_texture : Texture2D):
	var ratio := 1.0
	match fixed_type:
		FixedType.FIXED_WIDTH:
			ratio = new_texture.get_width() / base_size_px.x
		FixedType.FIXED_HEIGHT:
			ratio = new_texture.get_height() / base_size_px.y
	texture = new_texture
	pixel_size = base_pixel_size / ratio
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


