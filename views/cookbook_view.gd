extends Control
class_name CookbookView

#region Enums
enum Tab {PAUSE, MONSTERS, INGREDIENTS, RECIPES, OPTIONS}
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
var is_open : bool:
	get:
		return visible
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
func open(on_tab := Tab.PAUSE):
	_set_tab(on_tab)
	show()
	
func close():
	_hide_all_tabs()
	hide()
#endregion

#region Private functions
func _hide_all_tabs():
	for tab_node : Control in %Tabs.get_children():
		tab_node.hide()

func _set_tab(tab : Tab):
	_hide_all_tabs()
	var selected_tab : CookbookTabView
	match tab:
		Tab.PAUSE: 
			selected_tab = %PauseTabView
		Tab.MONSTERS:
			selected_tab = %MonsterTabView
		Tab.INGREDIENTS:
			pass
		Tab.RECIPES:
			pass
		Tab.OPTIONS:
			pass
		_: pass
	selected_tab.tab_selected()
#endregion

#region Subclasses
#endregion


