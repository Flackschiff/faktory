extends Node2D

class_name World_Interaction_Manager

signal building_clicked(building)

func _ready():
	WorldInteractionManager.connect("building_clicked", self._on_building_clicked)

func _on_building_clicked(building):
	building.on_right_click()
	
func _unhandled_input(event):#öffnet das UI unv Inventar von gebauden
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_RIGHT:

			var params := PhysicsPointQueryParameters2D.new()
			params.position = get_global_mouse_position()

			var space_state = get_world_2d().direct_space_state
			var result = space_state.intersect_point(params)

			if result.size() > 0:
				var collider = result[0].collider
				
				if collider.is_in_group("building"):
					emit_signal("building_clicked", collider)

func _input(event: InputEvent) -> void:
	#öffne den Player Inventory wenn E gedrückt und schließt alle inventare beim erneuten drücken von E
	if event.is_action_pressed("Inventar"):
		
		if InventoryManeger.inv_open: #wenn ein Inventar schon auf ist wird es geschlossen 
			InventoryManeger.close_inventory()
		else: #sonst wird es geöffnet 
			InventoryManeger.open_player_inventory()
		
