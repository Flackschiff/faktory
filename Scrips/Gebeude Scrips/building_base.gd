extends Node2D


class_name Building_base

@export var building_type := "generic"
@export var Building_materials := {
	"Eisen": 0,
	"Kupfer": 0
}
@export var size := Vector2i(1,1)


func test():
	return "Hallo ich bin eine Funktion aus der Base Klasse"
