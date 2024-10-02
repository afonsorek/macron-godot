extends Panel
class_name SelectIngredientView

#region Enums
#endregion

#region Parameters (consts and exportvars)
@onready var ingredient_panels : Dictionary = {
	"action_up":	%IngredientPanelUp,
	"action_right":	%IngredientPanelRight,
	"action_left":	%IngredientPanelLeft,
	"action_down":	%IngredientPanelDown
}
@onready var selected_ingredient_textures : Array[TextureRect] = [
	%SelectedIngredient0,
	%SelectedIngredient1,
	%SelectedIngredient2
]
#endregion

#region Signals
#endregion

#region Variables
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	_init_ingredient_panels()
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func clear_selected_ingredients(): update_selected_ingredients([])

func hide_panel():
	hide()
	for action in ingredient_panels:
		var panel = ingredient_panels[action]
	
func show_panel():
	var idx = 0
	for key in ingredient_panels:
		var panel : IngredientPanelView = ingredient_panels[key]
		if (idx < GameManager.ingredients.size()):
			panel.enable()
			var ingredient_name := GameManager.ingredients[idx]
			var ingredient := IngredientData.get_ingredient_by_name(ingredient_name)
			if !ingredient:
				continue
			panel.set_ingredient(ingredient)
		else:
			panel.disable()
		idx += 1
	show()
	
func update_selected_ingredients(selected_ingredient_names : Array[String]):
	for i in range(3):
		if i >= selected_ingredient_names.size():
			selected_ingredient_textures[i].texture = null
			continue
		var ingredient := IngredientData.get_ingredient_by_name(selected_ingredient_names[i])
		selected_ingredient_textures[i].texture = ingredient.base_texture
	var ready := selected_ingredient_names.size() == 3
	%ReadyPanelContainer.visible = ready
				
#endregion

#region Private functions
func _init_ingredient_panels():
	for key in ingredient_panels:
		var panel : IngredientPanelView = ingredient_panels[key]
		panel.set_action(key)
#endregion

#region Subclasses
#endregion


