extends NinePatchRect

@onready var icon : Sprite2D = $Item_Icon
@onready var lable: Label = $Label


func change_icon(new_icon: Texture2D):
	icon.texture = new_icon
	
func change_lable(new_count: int):
	lable.text = str(new_count)
