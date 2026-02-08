extends "res://Building maneger/building_base.gd"


@onready var label :Label = $Label
@onready var temp_erzzeichen = $"temp Erz zeichen"
@export var eisen_Erz_Icon: Texture2D
@export var kupfer_Erz_Icon: Texture2D


#es ist immer (60Hrz / Anzahl der Ressursen pro sekunde)
var reProSek: int = 60/1
#die aktuelle anzahl an ressurcen
var counter: int = 0
# countet jeden Frame
var tick: int
# die Art von block auf dem der Miner steht
var source_block : String


func _physics_process(delta: float):
	produce_resurces()
	
func _ready() -> void:
	source_block = placing_Check()
	if source_block == "Eisen":
		temp_erzzeichen.texture = eisen_Erz_Icon
	elif source_block == "Kupfer":
		temp_erzzeichen.texture = kupfer_Erz_Icon

func produce_resurces():
	if tick % reProSek == 0:
		label.text = str(counter)
		counter += 1
	if tick == 60:
		tick = 0	
	tick += 1
	
	
