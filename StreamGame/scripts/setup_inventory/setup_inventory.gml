/// @arg inventory_id
/// @arg name
/// @arg slots
/// @arg [allowed_itemtype]
/// @arg [...]

var inv_id		= argument[0];
var inv_name	= argument[1];
var inv_slots	= argument[2];

INVENTORY_INFO[inv_id, inventory_info.name]					= inv_name;
INVENTORY_INFO[inv_id, inventory_info.slots]				= inv_slots;
INVENTORY_INFO[inv_id, inventory_info.allowed_itemtypes]	= ds_list_create();

for (var i = 3; i < argument_count; i++) {
	ds_list_add(INVENTORY_INFO[inv_id, inventory_info.allowed_itemtypes], argument[i]);
}

INVENTORY_ITEMS_OWNED[inv_id]	= ds_list_create();
INVENTORY_ITEM_DATA[inv_id]		= ds_list_create();
INVENTORY_SLOTS[inv_id]			= ds_list_create();

if inv_slots > 0 {
	repeat(inv_slots) {
		ds_list_add(INVENTORY_SLOTS[inv_id], -1);	
	}
}

// Create this inventory list.
/*

ITEMS_OWNED			-> List of item IDs
INVENTORY_DATA		-> List of extra information about inventory items.

INVENTORY -> List of slots in the ITEMS_OWNED list.

HYPOTHETICAL:
Pick up a wrench and 20 coins.
	ITEMS_OWNED			= [item_wrench, item_baconweed]
	INVENTORY_DATA		= [1,			20]

And your inventory has 4 slots.
	INVENTORY			= [0,	1,  -1, -1]
	Because the wrench is in the 0 slot of "ITEMS_OWNED", and the coins are are in the 1 slot. -1 means we have nothing in that inventory slot.

If we want to move the wrench to the last spot of our inventory, then we do this:
	INVENTORY			= [-1,	1,  -1, 0]
	
*/
