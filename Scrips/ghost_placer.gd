extends Node2D

var building_scene := load("res://Scenen/Gebeude/building_miner.tscn")

func _process(_delta):
	var mouse_pos = get_global_mouse_position()
	global_position = get_parent().snap_to_grid(mouse_pos,32)

	if Input.is_action_just_pressed("LinkeMaustaste"):
		get_parent().place_object(building_scene, global_position)

	#bekommt die Aktuelle Maus Position und Rechnet sie um auf die Tile 
	var tile_pos = get_parent().resource_map.local_to_map(mouse_pos)
	#Bekommt das Objekt Tile Data 
	var tile_data = get_parent().resource_map.get_cell_tile_data(tile_pos)
	#muss vorher checken ob es Daten an der Stelle gibt sonst schmiert das ab ->    has_custom_data(layer_name: String)
	print("Tile Ressurce: ", tile_data.get_custom_data("RessurceType")) 
