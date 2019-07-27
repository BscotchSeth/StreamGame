/// @arg object_id
/// @arg [x=0]
/// @arg [y=0]

var the_object = argument[0];
var spawn_x = 0; if argument_count > 1 { spawn_x = argument[1]; }
var spawn_y = 0; if argument_count > 2 { spawn_y = argument[2]; }

return instance_create_depth(spawn_x,spawn_y,0,the_object);