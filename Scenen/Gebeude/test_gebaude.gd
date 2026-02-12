extends StaticBody2D

@export var inv_size: int
var inventar: Inventory
var tempItem = preload("res://Invetory/Items/Eisen Erz.tres")

var tempstack : Item_Stack = Item_Stack.new()

signal open_inventory(inventar :Inventory)

func _ready() -> void:
	inventar = Inventory.new(inv_size)  # <-- Jetzt korrekt!
	
	tempstack.item = tempItem
	tempstack.amount = 20
	
	inventar.slots[1] = tempstack

func on_right_click():
	print("signal Open Inventory wurde aus test gebaude gesendet")
	emit_signal("open_inventory", inventar)
	
