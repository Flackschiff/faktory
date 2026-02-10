extends Node2D

class_name Building_Maneger
@onready var temp_building = preload("res://Scenen/Gebeude/test_gebaude.tscn")


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("LinkeMaustaste"):
		var mouse_pos = get_global_mouse_position()
		place_building(mouse_pos,temp_building)
		

func place_building(building_position: Vector2, building_scene: PackedScene):
	var building = building_scene.instantiate()
	building.position = building_position
	
	#Signale Verbinden
	register_buildin(building)
	
	#Das Objekt in der Scene Plazieren 
	get_tree().current_scene.add_child(building)
	
func register_buildin(sender: Object):
  	sender.open_inventory.connect(_on_open_inventory(sender))
	
func _on_open_inventory(inventar: Inventory):
	InventoryManeger.display_inventory(inventar)
