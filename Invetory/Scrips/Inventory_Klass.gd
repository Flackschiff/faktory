extends Object

class_name Inventory
var inventory_size: int
var slots: Array[Item_Stack] # Maby = []

func _init(size: int) -> void:
	inventory_size = size
	slots = []
	slots.resize(size)

func add_item_index(index_to: int, stack: Item_Stack) -> bool:
	if check_index(index_to, stack):
		return true
	#Wenn das Selbe Iten Drinn ist wird es Addiert
	elif slots[index_to].stack == stack.item:
		#checkt ob die Max Stack size überschritten wurde wenn ja wird der Stack aufgefüllt und nicht weiter
		if slots[index_to].amount + stack.amount > stack.item.max_stack_size:
			var total: int = slots[index_to].amount + stack.amount
			slots[index_to].amount = stack.item.max_stack_size
			total -= stack.item.max_stack_size
			stack.amount = total
			return true
		#wenn nicht 
		else:
			slots[index_to].amount += stack.amount 
			stack.amount = 0 # item amount bei dem stack wird auf 0 gesetzt
			return true
	else:
		return false

#Checkt ob der Idex Korrekt ist oder außerhalb
#wenn der Slot leer ist wird der Stack direkt darin plazeirt
func check_index(index: int, stack: Item_Stack) -> bool:
	#Checkt ob der Index in range ist
	if index < 0 or index >= inventory_size:
		return false
	#Überprüft ob der Slot Leer ist wenn ja wird das Item da Plaziert
	elif slots[index]== null:
		slots[index] = stack # stack wird da einfach plaziert 
		stack.amount = 0
		return true
	else:
		return false
		
func move_item_index(Index_from: int, index_to: int) -> bool:
	if check_index(index_to, slots[Index_from]):
		return true
	else:
		return false
	
# mach leere platze wo 0 anzahl an stacks drinn sind wieder zu null
func check_empty():
	var index: int = 0
	for slot in slots:
		if slot != null:
			if slot.amount == 0:
				destroy_stack(index)
			index += 1
	
func destroy_stack(index_of_stack:int):
	slots[index_of_stack] = null

	
