extends Node2D


class_name Building_base

signal Signal_block(RessurceType: String)
@export var building_type :String
@export var building_materials : Dictionary[String, int]
@export var building_size := Vector2i(1,1)
@export var placeble: Array[String]

func _ready() -> void:
	pass
	
func placing_Check() -> String:
	var tile_map = get_parent().resource_map
	#bekommt die Aktuelle Maus Position und Rechnet sie um auf die Tile 
	var tile_pos = tile_map.local_to_map(global_position)
	#Bekommt das Objekt Tile Data 
	var tile_data = tile_map.get_cell_tile_data(tile_pos)
	#muss vorher checken ob es Daten an der Stelle gibt sonst schmiert das ab ->    has_custom_data(layer_name: String)
	
	if tile_data.has_custom_data("RessurceType") != null:
		var RessurceType = tile_data.get_custom_data("RessurceType")
		return RessurceType
		
	return "Fehler"
