extends Resource

class_name Item

@export var item_Name: String
@export var item_Sprite: Texture2D
@export var max_stack_size: int = 100
@export var beschreibung: String

enum item_type{Ressource, Building, Food, Wepon}
@export var item_Type: item_type
