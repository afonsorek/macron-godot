class_name FileUtility

static func get_resource_paths(dirPath : String) -> Array[String]:
	var dir = DirAccess.open(dirPath)
	dir.list_dir_begin()

	var resource_paths : Array[String] = []
	var file_name = dir.get_next()
	while(file_name!=""): 
		if dir.current_is_dir():
			pass
		else:
			if '.tres' in file_name:
				if '.tres.remap' in file_name:
					file_name = file_name.trim_suffix('.remap')
				resource_paths.append(dirPath+"/"+file_name)
		file_name = dir.get_next()
		
	return resource_paths
