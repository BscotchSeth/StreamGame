/// @arg xg
/// @arg yg
/// @arg zoffset

var xg		= argument0;
var yg		= argument1;
var zoffset = argument2;

var coords = grid_to_coord(xg,yg);

if ds_map_exists(TILES_SPAWNED, coords) {
	
	if !ds_map_exists(TILE_ZOFFSETS, coords) {
		var tile_sprite = TILES_SPAWNED[?coords];		
		ds_map_add(TILES_START_Y, coords, layer_sprite_get_y(tile_sprite));
		ds_list_add(TILES_WITH_Z_OFFSET, coords);
	}
	
	ds_map_replace(TILE_ZOFFSETS, coords, zoffset);
}