extends CookbookTabView
class_name PauseTabView

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
@onready var life_points_label := %LifePointsLabel as Label
@onready var defeated_monsters_label := %DefeatedMonstersLabel as Label
@onready var continue_button := %ContinueButton as Button
@onready var exit_button := %ExitButton as Button
var life_points_base : String
var defeated_monsters_base : String
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	life_points_base = life_points_label.text
	defeated_monsters_base = defeated_monsters_label.text
	continue_button.pressed.connect(_continue_game)
	exit_button.pressed.connect(_exit_game)
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func tab_selected():
	show()
#endregion

#region Private functions
func _continue_game():
	GameManager.unpause_game()

func _exit_game():
	GameManager.quit_game()
#endregion

#region Subclasses
#endregion


