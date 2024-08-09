extends Control
class_name KitchenUiView

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
@onready var cookbook := %Cookbook as CookbookView
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	pass
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func close_cookbook():
	cookbook.close()
	
func hide_select_ingredient():
	%SelectIngredientPanel.hide()

func open_cookbook():
	cookbook.open()
	
func on_satisfaction_changed(new_value : int, delta : int, max : int):
	if !%SatisfactionPanel.visible:
		%SatisfactionPanel.show()
	(%SatisfactionLabel as Label).text = "Satisfaction: %d/%d" % [new_value,max]
	
func show_select_ingredient():
	%SelectIngredientPanel.show()
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


