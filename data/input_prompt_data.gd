class_name InputPromptData

#region Enums
#endregion

#region Variables

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
			
static func get_input_prompt_texture(system: StringName, action: StringName) -> Texture2D:
	var pack := get_input_prompt_pack(system)
	for action_texture in pack.action_textures:
		if action == action_texture.action:
			return action_texture.texture
	print("No action by name %s in system %s!" % [action,system])
	return null

static func get_input_prompt_pack(system : StringName) -> InputPromptPack:
	if !input_prompt_packs:
		print("Input prompts not initialized!")
		return null
	for input_prompt_pack in input_prompt_packs:
		if input_prompt_pack.system == system:
			return input_prompt_pack
	print("No input prompt pack by name %s!" % system)
	return null
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion



