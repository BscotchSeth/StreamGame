layer_destroy(TERRAIN_LAYER);
layer_destroy(WALKOVER_LAYER);

ds_map_clear(TILES_SPAWNED);
ds_map_clear(TERRAIN_TYPES);
ds_list_clear(ROOM_CENTERS);
ds_list_clear(TERRAIN_LOCATIONS);

ds_map_clear(TILE_ZOFFSETS);
ds_list_clear(TILES_WITH_Z_OFFSET);
