extends Control

@onready var inv: Inv = preload("res://Invetory/Player_Inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var isOpen = false

func _ready():
	update_slots()
	close()
	
func update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])



func _process(delta):
	#öffnen un schließen des Inventars
	if Input.is_action_just_pressed("Inventar"):
		if isOpen:
			self.close()
		else:
			self.open()
	
#Schließt das Inventar
func close():
	visible = false
	isOpen = false
	
#Öfnet das Inventar
func open():
	visible = true
	isOpen = true
