class_name InputPromptData

#region Enums
#endregion

#region Variables
static var current_system : StringName = ""
static var input_prompt_packs : Array[InputPromptPack] = []
#endregion

#region Computed properties
#endregion

#region Public functions
static func initialize_input_prompts():
	var paths = FileUtility.get_resource_paths("res://data/input_prompt_packs")
	for path in paths:
		var new_input_prompt_pack : InputPromptPack = load(path)
		if (new_input_prompt_pack):
			input_prompt_packs.append(new_input_prompt_pack)
		else:
			print("Input prompt pack null!!")
			
static func get_input_prompt(action: StringName) -> InputPrompt:
	var pack := get_input_prompt_pack()
	for input_prompt in pack.input_prompts:
		if action == input_prompt.action:
			return input_prompt
	print("No action by name %s in system %s!" % [action,current_system])
	return null

static func get_input_prompt_pack() -> InputPromptPack:
	if !input_prompt_packs:
		print("Input prompts not initialized!")
		return null
	for input_prompt_pack in input_prompt_packs:
		if input_prompt_pack.system == current_system:
			return input_prompt_pack
	print("No input prompt pack by system %s!" % current_system)
	return null
	
static func set_system(system : StringName):
	current_system = system
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion



