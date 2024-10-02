extends Control
class_name HandUtensilsView

#region Enums
enum Utensil {NONE, CLEAVER}
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
@onready var cleaver := %CleaverView as CleaverView
var current_utensil : Utensil = Utensil.NONE
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	RhythmManager.input_judged.connect(_on_input_judged)
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func remove_utensil():
	set_utensil(Utensil.NONE)
	
func set_utensil(new_utensil : Utensil):
	# Se já for o utensílio atual, não faz nada
	if (new_utensil == current_utensil):
		return
	# Se nao, troca
	var before_utensil_node := _get_utensil_node(current_utensil)
	if before_utensil_node:
		before_utensil_node.exit_animation()
	current_utensil = new_utensil
	var new_utensil_node := _get_utensil_node(new_utensil)
	if new_utensil_node:
		new_utensil_node.enter_animation() 
#endregion

#region Private functions
func _get_utensil_node(utensil : Utensil) -> Control:
	match utensil:
		Utensil.CLEAVER:
			return %CleaverView as Control
		_:
			return null
			
func _on_input_judged(_result : bool, animate : bool):
	var utensil_node := _get_utensil_node(current_utensil)
	if !utensil_node:
		return
	if animate:
		utensil_node.use_animation()
#endregion

#region Subclasses
#endregion


