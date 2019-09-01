/// @arg list
/// @arg element

var the_list	= argument0;
var the_element = argument1;

for ( var i = ds_list_size(the_list)-1; i >= 0; i--) {
	if the_list[|i] == the_element {
		ds_list_delete(the_list, i);	
	}
}