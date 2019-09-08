enum itemtype {
	currency,
	seed,
	enemy,
	plant,
	weapon,
	structure,
	tool
}

enum iteminfo {
	name,
	object,
	type
}

#macro item_nothing -1
#macro item_tongueflower 0
#macro item_warppad 1
#macro item_money 2

globalvar ITEM_INFO; ITEM_INFO = 0;

setup_item(item_tongueflower,	"Tongueflower",	itemtype.plant,		o_tongueflower);
setup_item(item_warppad,		"Warp Pad",		itemtype.structure, o_warppad);
setup_item(item_money,			"Warp Pad",		itemtype.currency,	o_pickup);
