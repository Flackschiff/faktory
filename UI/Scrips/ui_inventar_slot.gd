extends TextureButton

@onready var icon : Sprite2D = $Item_Icon
@onready var lable: Label = $Label

var index: int
var inv: Inventory


func change_icon(new_icon: Texture2D):
	icon.texture = new_icon
	
func change_lable(new_count: int):
	lable.text = str(new_count)

func reset_visual():
	icon.texture = null
	lable.text = ""
	

func _pressed() -> void:
	var mouse_pos = get_global_mouse_position()
	_get_drag_data(mouse_pos)

func _get_drag_data(_at_position: Vector2) -> Variant:
	print(inv)
	var data = {
	"item": inv.slots[index],
	"index": index,
	"pickup_inv": inv #das Inventar aus dem man sachen aufhebt
	}

	if inv.is_slot_occupied(index):
		print("get drag data")
		print(data["item"].item.item_Name)
		set_drag_preview(get_preview())
		return data
	else:
		print("kein Item im platz")
		print("index: "+ str(index))
		return null
	

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	#acceptiert wenn der slot leer ist oder das selbe item drinn ist
	if not inv.is_slot_occupied(index) or not data["index"] == index:
		return true
	else:
		return false
		
		
func _drop_data(_at_position: Vector2, data: Variant ) -> void:
	var erfolgreich: bool = inv.add_item_index(index, data["item"])#verschiebt das Item gibt True zurück wenn es geklapt hat false wenn nicht
	if erfolgreich: #wird nur ausgeführt wenn add_item_index() funktioniert hat
		InventoryManeger.destroy_stack(data["index"], data["pickup_inv"]) # zerstört den slot aus dem das Item kan
	InventoryManeger.update_inventory(inv)
	InventoryManeger.update_inventory(data["pickup_inv"])
	
func get_preview():
	var icon = inv.slots[index].item.item_Sprite
	var container = TextureRect.new()
	container.texture = icon

	return container
	
