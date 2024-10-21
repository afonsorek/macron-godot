class_name Monster
extends Resource

#region Enums
enum Hunger {NIBBLER = 1, HUNGRY, INSATIABLE, DEVOURER, RAVENOUS}
enum Aggressiveness {CALM = 1, OPPORTUNISTIC, AGGRESSIVE, FURIOUS, BERSERKER}
enum Impatience {PATIENT = 1, IMPATIENT, IMMEDIATIST, HOTHEAD, ZERO_TOLERANCE}
#endregion

#region Variables
@export var name : StringName
@export_multiline var descriptions : Array[String]
@export_multiline var tips : Array[String]
@export var hunger := Hunger.NIBBLER
@export var aggressiveness = Aggressiveness.CALM
@export var impatience := Impatience.PATIENT
@export var base_sprite : Texture2D
# TODO: Mudar para MonsterTaste
@export var tastes : Array[MonsterTaste] = []
@export var view_tscn : PackedScene
var knowledge_level := 0

#endregion

#region Computed properties
var max_satisfaction : int:
	get: return 30+hunger*10
var satisfaction_damage : int:
	get: return 4*aggressiveness
var waiting_beats : int:
	get: return (6-impatience)*4
#endregion

func _init():
	pass

#region Public functions
func enter(controller: MonsterController) -> void:
	print("%s was chosen!" % name)
	
func update(controller: MonsterController, delta : float) -> void:
	pass
	
func beat(controller: MonsterController) -> void:
	pass
	
func exit(controller: MonsterController) -> void:
	pass
	
func get_aggressiveness_level(ag: int) -> String:
	return Aggressiveness.find_key(ag)
	
func get_impatience(imp: int) -> String:
	return Impatience.find_key(imp)
	
func get_hunger_level(hg: int) -> String:
	return Hunger.find_key(hg)
	
func get_taste(element: Global.Element) -> MonsterTaste:
	for taste in tastes:
		if taste.element == element:
			return taste
	return null
	
func has_taste(element: Global.Element) -> bool:
	for taste in tastes:
		if taste.element == element:
			return true
	return false
#endregion

#region Subclasses
#endregion


