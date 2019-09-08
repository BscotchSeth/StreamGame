#macro inventory_player 0
#macro inventory_wallet 1
#macro inventory_farm	2

enum inventory_info {
	name,
	slots,
	allowed_itemtypes
}

globalvar INVENTORY_INFO; INVENTORY_INFO = 0;

globalvar INVENTORY_ITEMS_OWNED;	INVENTORY_ITEMS_OWNED = 0;
globalvar INVENTORY_ITEM_DATA;		INVENTORY_ITEM_DATA = 0;
globalvar INVENTORY_SLOTS;			INVENTORY_SLOTS = 0;

setup_inventory(inventory_player,	"Inventory", 30, 
	itemtype.seed,
	itemtype.plant,
	itemtype.weapon,
	itemtype.tool);
	
setup_inventory(inventory_wallet,	"Wallet", 30, itemtype.currency);
setup_inventory(inventory_farm,		"Silo", 30);