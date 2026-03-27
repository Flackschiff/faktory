extends CharacterBody2D

var speed := 200.0
var player_Inventar : Inventory

#temporär
var tempItem = preload("res://Invetory/Items/Eisen Erz.tres")
var tempitem2 = preload("res://Invetory/Items/Kupfer Erz.tres")
var tempstack : Item_Stack = Item_Stack.new()
var tempstack2 : Item_Stack = Item_Stack.new()

func _ready() -> void:
	player_Inventar = Inventory.new(16,Inventory.besitzer.Player)
	
	#temporär
	tempstack.item = tempItem
	tempstack2.item = tempitem2
	tempstack.amount = 60
	tempstack2.amount = 80
	player_Inventar.add_item_index(0,tempstack)
	player_Inventar.add_item_index(5,tempstack)
	player_Inventar.add_item_index(6,tempstack2)
	InventoryManeger.update_player_inv(player_Inventar)



func _physics_process(_delta):
	var input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if input_vector.length() > 0:
		input_vector = input_vector.normalized()

	velocity = input_vector * speed
	move_and_slide()
