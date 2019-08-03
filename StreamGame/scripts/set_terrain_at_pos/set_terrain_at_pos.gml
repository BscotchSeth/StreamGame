/// @arg xg
/// @arg yg
/// @arg terrain_type

var xg			= argument0;
var yg			= argument1;
var terraintype = argument2;

var this_position_coords = grid_to_coord(xg, yg);
if !ds_map_exists(TERRAIN_TYPES, this_position_coords) {
	ds_list_add(TERRAIN_LOCATIONS, this_position_coords);
}
ds_map_replace(TERRAIN_TYPES, this_position_coords, terraintype);