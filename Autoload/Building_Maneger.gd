extends Node2D

class_name Building_Maneger
@onready var temp_building = preload("res://Buildings/Szenen/test_gebaude.tscn")


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("LinkeMaustaste"):
		var mouse_pos = get_global_mouse_position()
		place_building(mouse_pos,temp_building)
		

func place_building(building_position: Vector2, building_scene: PackedScene):
	var building = building_scene.instantiate()
	building.position = snap_to_grid(building_position)
	
	#Signale Verbinden im Inventory Maneger
	InventoryManeger.connect_building_signal(building)

	#Das Objekt in der Scene Plazieren 
	get_tree().current_scene.add_child(building)
	
func snap_to_grid(pos: Vector2, cell_size := 32) -> Vector2: #CELL_SIZE IRGENTWANN ÄNDERN 
	return Vector2(
		round(pos.x / cell_size) * cell_size,
		round(pos.y / cell_size) * cell_size
	)
	
	
