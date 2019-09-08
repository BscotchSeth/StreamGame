/// @arg item_id
/// @arg name
/// @arg type
/// @arg object

var iid			= argument0;
var iname		= argument1;
var itype		= argument2;
var i_object	= argument3;

ITEM_INFO[iid, iteminfo.name]		= iname;
ITEM_INFO[iid, iteminfo.type]		= itype;
ITEM_INFO[iid, iteminfo.object]		= i_object;
