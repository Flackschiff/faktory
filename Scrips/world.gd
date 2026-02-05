extends Node2D

@export var resource_map: TileMapLayer

func snap_to_grid(pos: Vector2, cell_size := 16) -> Vector2:
	return Vector2(
		round(pos.x / cell_size) * cell_size,
		round(pos.y / cell_size) * cell_size
	)

func place_object(object_scene: PackedScene, place_position: Vector2):
	var object_instance = object_scene.instantiate()
	object_instance.position = place_position
	add_child(object_instance)
