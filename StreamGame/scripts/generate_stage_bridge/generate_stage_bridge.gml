/// @arg xg_start
/// @arg yg_start
/// @arg xg_destination
/// @arg yg_destination

var xg_current	= argument0;
var yg_current	= argument1;
var xg_dest		= argument2;
var yg_dest		= argument3;

while !(xg_current == xg_dest && yg_current == yg_dest) {
	set_terrain_at_pos(xg_current, yg_current, terrain_type.bridge);
	var dir_to_move = point_direction(xg_current, yg_current, xg_dest, yg_dest);
	dir_to_move = round_to_nearest(dir_to_move, 90)+choose(-90,0,90);
	xg_current = round(xg_current+lengthdir_x(1, dir_to_move));
	yg_current = round(yg_current+lengthdir_y(1, dir_to_move));
}