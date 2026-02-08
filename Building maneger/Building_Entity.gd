extends Node2D

class_name Building_Entity

var inventory: Inventory = Inventory.new(3)
@export var has_inventory: bool
@export var health: int
@export var building_size: Vector2i

signal open_inventory(inventory: Inventory)
