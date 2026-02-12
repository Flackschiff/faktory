extends Node2D

class_name World_Interaction_Manager

signal building_clicked(building)

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_RIGHT:

			var params := PhysicsPointQueryParameters2D.new()
			params.position = get_global_mouse_position()

			var space_state = get_world_2d().direct_space_state
			var result = space_state.intersect_point(params)

			if result.size() > 0:
				var collider = result[0].collider
				
				if collider.is_in_group("building"):
					print("es wurde auf ein gebaude geklickt")
					emit_signal("building_clicked", collider)
