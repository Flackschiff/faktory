extends Control

class_name Inventory_Maneger

var ui_window: Node = preload("res://UI/Szenen/Ui_Window.tscn").instantiate()
var miner_inventory: PackedScene = preload("uid://nfok3mdfn7s4")
var player_inventory : PackedScene = preload("uid://buy5qjtcbrqie")

#Pfade zu den Nodes
var ui_root: Control
var primary_container: Control
var secondary_container : Control

#Spieler Inventare und ui`s
var player_inv: Inventory
var player_ui

#Gebaude Inventare und ui`s
var current_ui 
var current_inv: Inventory
var current_index :int

var inv_open: bool = false

func _ready():
	ui_root = get_tree().current_scene.get_node("UI/UI_Root")
	primary_container = ui_root.get_child(0).get_child(0) 
	secondary_container = ui_root.get_child(0).get_child(1)



func display_inventory(inventar: Inventory):
	if not inv_open:
		#ist gerade immer das Miner Inv soll aber variable sein irgentwann !!!!!!!!!!!!!!
		open_player_inventory() #soll eigetnlich gleichzeitig das player und objekt inv öffnen bis jetzt nur fehler
		current_ui = miner_inventory.instantiate() #erstellt das neue Inventar 
		secondary_container.add_child(current_ui) #fügt es zum zu_tree hinzu 
		update_inventory(inventar) # und updatet es
		current_ui.position = Vector2(200,200) #setzt die position
		setup_slots(inventar,get_slots_node(secondary_container)) #TEMPORÄR
		change_current_inv(inventar)
		inv_open = true


#füllt die anzeige mit der Sprite und Anzahl aus dem Inventory
func update_inventory(inventar: Inventory): 
	var container = get_container(inventar)

	for i in inventar.slots.size():
		var stack = inventar.slots[i]
		var slot = container.get_child(i)

		if stack != null:
			slot.change_icon(stack.item.item_Sprite)
			slot.change_lable(stack.amount)
		
func setup_slots(inv: Inventory, slots_node: Node):
	var counter = 0
	for slot in slots_node.get_children():
		slot.inv = inv
		slot.index = counter
		counter +=1


func close_inventory():
	if inv_open:
		if current_ui != null:
			current_ui.queue_free()
		if player_ui != null:
			player_ui.queue_free()
		inv_open = false
	
func connect_building_signal(sender: Object):
	sender.connect("open_inventory", self._on_open_inventory)

func _on_open_inventory(inventar: Inventory):
	display_inventory(inventar)
	
func open_player_inventory():
	if player_ui == null:
		player_ui = player_inventory.instantiate()
		primary_container.add_child(player_ui)
		setup_slots(player_inv, primary_container.get_node("Inventar_UI/CenterContainer/Inventar_Slots_UI"))
		update_inventory(player_inv)
		inv_open = true


func destroy_stack(index: int, inv: Inventory = null): #wäre besser zu sagen von welchem Inv 
	inv.slots[index] = null
	var container = get_container(inv)

	for slot in container.get_children():
		if slot.index == index:
			slot.reset_visual()

#Returnt die Node zu den Slots von dem Inventar
func get_container(inv: Inventory) -> Node: 
	if inv.owner == Inventory.besitzer.Player:
		return get_slots_node(primary_container)
	else:
		return get_slots_node(secondary_container)

#ändert das current_inv in Inventory_Maneger
func change_current_inv(inventar):
	current_inv = inventar
	
#ändert das player_inv in Iventory_Maneger
func update_player_inv(inventar:Inventory):
	player_inv = inventar

func get_slots_node(inv_node: Node):
	return inv_node.get_node("Inventar_UI/CenterContainer/Inventar_Slots_UI")
