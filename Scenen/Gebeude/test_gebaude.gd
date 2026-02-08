extends StaticBody2D

@export var inv_size: int
var inventar: Inventory = Inventory.new(inv_size)

signal open_inventory(inventar :Inventory)

#checkt ob auf das gebaude gedrückt wurde
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
		if event is InputEventMouseButton and event.pressed:
			emit_signal("open_inventory", inventar) #schickt das signal mit Referrenz von Inventar
