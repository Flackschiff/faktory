extends NinePatchRect


func update_inventory(inventar: Inventory):
		for i in inventar.slots.size():
			var stack = inventar.slots[i]
			var slot = $CenterContainer/Inventar_Slots_UI.get_child(i)

			if stack != null:
				slot.change_icon(stack.item.item_Sprite)
				slot.change_lable(stack.amount)
