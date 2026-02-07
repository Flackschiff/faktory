extends Panel

@onready var item_visual: Sprite2D = $"CenterContainer/Panel/Item Display"
@onready var item_text: Label = $CenterContainer/Panel/Label

func update(slot: InvSlot):
	if !slot.item:
			item_visual.visible = false
			item_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		item_text.text = str(slot.amount)
