class_name MonsterData

#region Enums
#endregion

#region Variables
static var monsters : Array[Monster] = []
#endregion

#region Computed properties
#endregion

func _init():
	pass

#region Public functions
static func initialize_monsters():
	monsters = []

static func get_monster_by_name(name : StringName) -> Monster:
	if !monsters:
		print("Monsters not initialized!")
		return null
	for monster in monsters:
		if monster.name == name:
			return monster
	return null
	
static func increase_knowledge_level(name : StringName) -> void:
	var monster = get_monster_by_name(name)
	if monster:
		monster.knowledge_level += 1
#endregion

#region Subclasses
#endregion


