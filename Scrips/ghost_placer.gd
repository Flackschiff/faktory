extends Node2D

var building_scene := load("res://Scenen/Gebeude/building_miner.tscn")
@onready var rect: ColorRect = $ColorRect

func _process(_delta):
	var mouse_pos = get_global_mouse_position()
	global_position = get_parent().snap_to_grid(mouse_pos,32)

	place_bilding(building_scene)
	if !valid_place_Check(building_scene):
		rect.color = Color(0.847, 0.0, 0.0, 1.0)
	else:
		rect.color = Color(0.435, 0.933, 0.0, 1.0)
	

func place_bilding(building: Resource):
	if Input.is_action_just_pressed("LinkeMaustaste"):
		get_parent().place_object(building, global_position)


func valid_place_Check(building: Resource) -> bool:
	var tile_map = get_parent().resource_map
	#bekommt die Aktuelle Maus Position und Rechnet sie um auf die Tile 
	var tile_pos = tile_map.local_to_map(get_global_mouse_position())
	#Bekommt das Objekt Tile Data 
	var tile_data = tile_map.get_cell_tile_data(tile_pos)
	#ckeckt ob es daten an dieser Tile gibt
	if tile_data.has_custom_data("RessurceType") != null:
		var RessurceType = tile_data.get_custom_data("RessurceType")
		#index 5 ist bei der Klasse Miner der Index für Placeble
		for res in building.get_state().get_node_property_value(0, 5):
			if RessurceType == res:
				return true

		
	return false
