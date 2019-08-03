/// @arg xtarget
/// @arg ytarget

var xtarg = argument0;
var ytarg = argument1;

var grid_dest	= world_to_grid(xtarg, ytarg);
var dest_coords = grid_to_coord(grid_dest[0], grid_dest[1]);

if ds_map_exists(TILES_SPAWNED, dest_coords) {
	return true;
}

return false;