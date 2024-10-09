extends Control
class_name KitchenUiView

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
@onready var select_ingredient := %SelectIngredient as SelectIngredientView
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	GameManager.game_ended.connect(_on_game_ended)
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func hide_select_ingredient(): select_ingredient.hide_panel()
	
func on_satisfaction_changed(new_value : int, delta : int, max : int):
	if !%SatisfactionPanel.visible:
		%SatisfactionPanel.show()
	(%SatisfactionLabel as Label).text = "Satisfaction: %d/%d" % [new_value,max]
	
func show_select_ingredient(): select_ingredient.show_panel()

func show_info_panel(text := ""):
	%InfoPanel.show()
	%InfoLabel.text = text
#endregion

#region Private functions
func _on_game_ended(result : bool):
	show_info_panel("Você venceu!!!" if result else "Você perdeu!!!")
#endregion

#region Subclasses
#endregion


