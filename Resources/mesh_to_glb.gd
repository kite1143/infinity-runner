@tool
extends Node3D

# Renamed again to ensure the Inspector clears old cache errors
@export var run_export_v3: bool = false:
	set(value):
		execute_export_logic()
		# We don't actually need to set it to true, so we leave it false

func execute_export_logic():
	if !is_inside_tree() or !Engine.is_editor_hint():
		return

	var dir_path = "res://Assets/WorldBuiding/Village/Medieval_Pack/glb_export/"
	
	if !DirAccess.dir_exists_absolute(dir_path):
		DirAccess.make_dir_recursive_absolute(dir_path)
		print("Created directory: ", dir_path)

	var count = 0
	
	for child in get_children():
		if child is MeshInstance3D:
			var mesh_instance = child as MeshInstance3D
			var file_path = dir_path + mesh_instance.name + ".glb"
			
			# Setup the GLTF tools
			var gltf_doc = GLTFDocument.new()
			var gltf_state = GLTFState.new()
			
			# append_from_scene is the correct Godot 4 function
			# Arguments: (Node, State, Flags)
			var append_result = gltf_doc.append_from_scene(mesh_instance, gltf_state)
			
			if append_result == OK:
				var save_result = gltf_doc.write_to_filesystem(gltf_state, file_path)
				if save_result == OK:
					print("Exported: ", mesh_instance.name)
					count += 1
				else:
					printerr("Save error on ", mesh_instance.name, ": ", save_result)
			else:
				printerr("Append error on ", mesh_instance.name, ": ", append_result)

	if count > 0:
		print("Success! Exported ", count, " files.")
		EditorInterface.get_resource_filesystem().scan()
	else:
		print("No MeshInstance3D children found.")
