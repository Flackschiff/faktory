extends Object

class_name Inventory
var inventory_size: int
var slots: Array[Item_Stack] 
var owner: besitzer
enum besitzer{ #wird verwendet um zwischen den inventaren von gebauden und spieler zu unterscheiden
	Player,
	BUILDING
}
enum slot_state{
	EMPTY,
	AMOUNT0,
	SAME_OCUPANT,
	DIFFERENT_OCCUPANT,
	INVALID,
	OCCUPIED
}


func _init(size: int, inv_owner: besitzer = besitzer.BUILDING) -> void:
	inventory_size = size
	slots.resize(size)
	owner = inv_owner


func add_item_index(index_to: int, stack: Item_Stack) -> bool:
	var state = check_slot_state(index_to, stack)

	match state:
		slot_state.EMPTY:
			# Slot ist leer → Stack reinlegen
			slots[index_to] = Item_Stack.new() #erstellt ein neues Inv_slot und übergibt die werte
			slots[index_to].amount = stack.amount
			slots[index_to].item = stack.item

			return true

		slot_state.SAME_OCUPANT:
			# gleicher Stack → addieren
			var max_stack = stack.item.max_stack_size
			var total = slots[index_to].amount + stack.amount
			print("total: " + str(total))

			if total > max_stack:
				slots[index_to].amount = max_stack
				var rest = total - max_stack
				stack.amount = rest
				return false
					
					
					
			else:
				slots[index_to].amount = total

			return true

		_:
			# alle anderen Fälle → nicht möglich
			return false



#check Index Checkt folgende sachen
#Index out of range = Invalid
#slot.amount 0 ist = Amunt0
#slot == null = Empty
#selber Stack wie geprüft 
func check_slot_state(index: int, stack: Item_Stack) -> slot_state:
	#Checkt ob der Index in range ist
	if 0 <= index and index < inventory_size :
		
		#checkt ob der Index leer ist
		if slots[index]== null:
			return slot_state.EMPTY
			
		#check ob die Anzahl 0 ist
		if slots[index].amount == 0:
			return slot_state.AMOUNT0
			
		#checkt ob es der Selbe stack im Index ist
		if slots[index].item == stack.item:
			return slot_state.SAME_OCUPANT
			
		#wenn nichts von oben war ist muss ein anderes Item in dem Slot sein
		else:
			return slot_state.DIFFERENT_OCCUPANT

	else:
		return slot_state.INVALID
		
func is_slot_occupied(index :int) -> bool:
	if slots[index] == null:
		return false
		
	else:
		return true	
	
# mach leere platze wo 0 anzahl an stacks drinn sind wieder zu null
func check_empty():
	var index: int = 0
	for slot in slots:
		if slot != null:
			if slot.amount == 0:
				InventoryManeger.destroy_stack(index)
			index += 1
	
	
func change_amount(index: int, new_amount: int):
	slots[index].amount = new_amount
