extends Control

@onready var inv: Inv = preload("res://Invetory/Instances/Player_Inventory.tres")
@onready var slots: Array = $Inventory/GridContainer.get_children()

var isOpen = false

func _ready():
	update_slots()
	close()
	
func update_slots():
	#index für die seperaten Inventory Slots im Invetar
	var index = 0
	#Iterriert über alle objekte im Aktuellen Invetory
	for obj in inv.slots:
		#macht die aktuellen Invetar sachen dass sie angezeigt werden 
		slots[index].update(obj)
		index += 1





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
