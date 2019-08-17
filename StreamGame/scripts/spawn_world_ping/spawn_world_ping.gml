/// @arg x
/// @arg y
/// @arg [color=c_white]

var xx	= argument[0];
var yy	= argument[1];
var col	= c_white; if argument_count > 2 { col = argument[2]; }

with instance_create(o_world_ping, xx, yy) {
	color = col;
}