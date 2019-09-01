/// @arg x
/// @arg y
/// @arg player_id

var xpos = argument0;
var ypos = argument1;
var pid	 = argument2;

with instance_create(o_player, xpos, ypos) {
	player_id = pid;
	camera_set_target(id);	
}