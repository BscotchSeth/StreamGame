/// @arg xtarget
/// @arg ytarget
/// @arg [ignore_solids=false]

var xtarg = argument[0];
var ytarg = argument[1];
var ignore_solids = false; if argument_count > 2 { ignore_solids = argument[2]; }

var grid_dest	= world_to_grid(xtarg, ytarg);
var dest_coords = grid_to_coord(grid_dest[0], grid_dest[1]);

if ds_map_exists(TILES_SPAWNED, dest_coords) {
	if ignore_solids {
		return true;	
	}
	else if place_free(xtarg, ytarg) {
		return true;
	}
}

return false;