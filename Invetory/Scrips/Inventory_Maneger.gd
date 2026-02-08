extends Node

class_name Inventory_Maneger

var ui_window: Node = preload("res://UI/Ui_Window.tscn").instantiate()
var ui_miner: Node = preload("res://UI/UI_Inventar_Miner.tscn").instantiate()
var ui_root: Control

func _ready():
	ui_root = get_tree().current_scene.get_node("UI/UI_Root")



func transfer_items(from_inventory: Inventory, to_inventory: Inventory, from_index: int, to_index: int):
	#holt sich das Item aus dem Inventory
	var stack_transit: Item_Stack = from_inventory.slots[from_index]
	
func display_inventory(inventar: Inventory):
	pass
	
func build_inventory_ui():
	pass
