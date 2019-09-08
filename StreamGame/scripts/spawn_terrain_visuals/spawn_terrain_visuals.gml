
var spawn_order = ds_priority_create();
for ( var i = 0; i < ds_list_size(TERRAIN_LOCATIONS); i++){
	var this_coord = TERRAIN_LOCATIONS[|i];
	var this_xy = coord_to_grid(this_coord);
	var this_world_xy = grid_to_world(this_xy[0], this_xy[1]);
	ds_priority_add(spawn_order, this_coord, this_world_xy[1]);
}

while !ds_priority_empty(spawn_order) {
	var this_coord = ds_priority_delete_max(spawn_order);
	var this_xy = coord_to_grid(this_coord);
	var sprite_to_spawn = sp_tl_main;
	
	switch TERRAIN_TYPES[?this_coord] {
		case terrain_type.edge:
			sprite_to_spawn = sp_tl_edge;
			break;
		case terrain_type.bridge:
			sprite_to_spawn = sp_tl_bridge;
			break;
	}
	
	var world_xy = grid_to_world(this_xy[0], this_xy[1]);
	
	var sp = layer_sprite_create(TERRAIN_LAYER,
		world_xy[0]+irandom_range(-2,2),
		world_xy[1]+irandom_range(-2,2), sprite_to_spawn);
	
	layer_sprite_blend(sp, color_darken(c_white, random_range(.93,1)));
	ds_map_add(TILES_SPAWNED, this_coord, sp);
	ds_list_add(TILES_LIST, sp);
}

ds_priority_destroy(spawn_order);