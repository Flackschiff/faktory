extends Control

class_name UI_Maneger

func _ready():
	WorldInteractionManager.connect("building_clicked", self._on_building_clicked)

func _on_building_clicked(building):
	building.on_right_click()
	
