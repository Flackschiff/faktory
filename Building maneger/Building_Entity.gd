extends Node2D

class_name Building_Entity

var inventory: Inventory = Inventory.new(3)
@export var has_inventory: bool
@export var health: int
@export var building_size: Vector2i

signal open_inventory(inventory: Inventory)

func on_right_click():
	print("signal Open Inventory wurde aus test gebaude gesendet")
	emit_signal("open_inventory", inventory)
