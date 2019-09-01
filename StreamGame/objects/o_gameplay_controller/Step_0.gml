for ( var i = ds_list_size(TILES_WITH_Z_OFFSET)-1; i >= 0; i--){
	var this_tile_coords	= TILES_WITH_Z_OFFSET[|i];
	
	var this_tile_sprite	= TILES_SPAWNED[?this_tile_coords];
	var this_tile_z			= TILE_ZOFFSETS[?this_tile_coords];
	var this_tile_ystart	= TILES_START_Y[?this_tile_coords];
	
	layer_sprite_y(this_tile_sprite, this_tile_ystart+this_tile_z);
	
	this_tile_z = lerp(this_tile_z, 0, .05);
	
	if abs(this_tile_z) < .5 {
		ds_map_delete(TILE_ZOFFSETS, this_tile_coords);
		ds_map_delete(TILES_START_Y, this_tile_coords);
		ds_list_delete(TILES_WITH_Z_OFFSET, i);
	}
	else {
		TILE_ZOFFSETS[?this_tile_coords] = this_tile_z;
	}
}

var num_players_required = max(1, ds_list_size(ACTIVE_GAMEPADS));
if instance_number(o_player) < num_players_required {
	var player_ids_required = ds_list_create();
	for ( var i = 0; i < num_players_required; i++){
		ds_list_add(player_ids_required, i);
	}
	
	with o_player {
		ds_list_delete_element(player_ids_required, player_id);	
	}
	
	for ( var i = 0; i < ds_list_size(player_ids_required); i++){
		spawn_player(0,0,player_ids_required[|i]);
	}
	ds_list_destroy(player_ids_required);
}

if keyboard_check_pressed(ord("R")) {
	room_restart();
}

if keyboard_check_pressed(vk_escape) {
	trigger_back_action();
}