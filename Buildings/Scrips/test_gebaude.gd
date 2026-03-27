extends StaticBody2D

@export var inv_size: int
var inventar: Inventory
var tempItem = preload("res://Invetory/Items/Eisen Erz.tres")

var tempstack : Item_Stack = Item_Stack.new()

signal open_inventory(inventar :Inventory)

func _ready() -> void:
	inventar = Inventory.new(inv_size)
	tempstack.item = tempItem
	tempstack.amount = randi_range(1,100)
	inventar.add_item_index(1,tempstack)




func on_right_click():
	emit_signal("open_inventory", inventar)
	
