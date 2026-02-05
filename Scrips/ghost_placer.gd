extends Node2D

"res://Scenen/gebaude_platzhalter.tscn"

var building_scene := load("res://Scenen/gebaude_platzhalter.tscn")

func _process(_delta):
	var mouse_pos = get_global_mouse_position()
	global_position = get_parent().snap_to_grid(mouse_pos,32)

	if Input.is_action_just_pressed("LinkeMaustaste"):
		get_parent().place_object(building_scene, global_position)


	var tile_pos = get_parent().resource_map.local_to_map(mouse_pos)
	var id = get_parent().resource_map.get_cell_atlas_coords(tile_pos)
	print("Tile ID: ", id) 
