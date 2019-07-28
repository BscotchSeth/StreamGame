globalvar WORLD_LAYER; WORLD_LAYER = -1;

globalvar ROOM_CENTERS; ROOM_CENTERS = ds_list_create();
globalvar TERRAIN_EDGE_LIST; TERRAIN_EDGE_LIST = ds_list_create();
globalvar TERRAIN_LOCATIONS; TERRAIN_LOCATIONS = ds_list_create();

globalvar TERRAIN_TYPES; TERRAIN_TYPES = ds_map_create();

enum terrain_type {
	interior,
	edge
}