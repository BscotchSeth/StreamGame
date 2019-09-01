/// @arg list
/// @arg item

var the_list = argument0;
var the_item = argument1;

if !ds_list_contains(the_list, the_item) {
	ds_list_add(the_list, the_item);	
}