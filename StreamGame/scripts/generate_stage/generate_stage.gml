/*
Create a system where we can generate "rooms"
a "room" is just a chunk of terrain floating in the world
Rooms are connected by "hallways" or "bridges"
*/

clear_world_tiles();
WORLD_LAYER = layer_create(TERRAIN_DEPTH);

var num_rooms		= irandom_range(5,100);
var room_min_radius	= 3;
var room_max_radius	= 7;

var room_xg = 0;
var room_yg = 0;
var previous_room_xg = 0;
var previous_room_yg = 0;

var room_radius = irandom_range(room_min_radius,room_max_radius);

var main_direction	= irandom(359);
var angle_range		= 130;

#region Set the locations of the rooms
while ds_list_size(ROOM_CENTERS) < num_rooms {
	var this_room_center = [room_xg, room_yg];
	generate_stage_room(room_xg, room_yg, room_radius);
	
	var new_room_radius		= irandom_range(room_min_radius,room_max_radius);
	var new_room_direction	= main_direction + random_range(-angle_range,angle_range);// irandom(359);
	var bridge_length		= irandom_range(2,10);
	var new_room_distance_from_current_room	= room_radius + new_room_radius + bridge_length;
	
	room_radius = new_room_radius;
	
	room_xg = round(room_xg + lengthdir_x(new_room_distance_from_current_room, new_room_direction));
	room_yg = round(room_yg + lengthdir_y(new_room_distance_from_current_room, new_room_direction));
}
#endregion

for ( var i = 0; i < ds_list_size(ROOM_CENTERS)-1; i++){
	var this_room_xy = ROOM_CENTERS[|i];
	var next_room_xy = ROOM_CENTERS[|i+1];
	
	generate_stage_bridge(this_room_xy[0], this_room_xy[1], next_room_xy[0], next_room_xy[1]);
}


#region Update terrain types for edges
for ( var i = 0; i < ds_list_size(TERRAIN_LOCATIONS); i++){
	var this_coord = TERRAIN_LOCATIONS[|i];
	
	//if TERRAIN_TYPES[?this_coord] == terrain_type.interior {
		var this_xy = coord_to_grid(this_coord);
		var is_edge = false;
	
		for ( var xg = this_xy[0]-1; xg <= this_xy[0]+1 && !is_edge; xg++){
			for ( var yg = this_xy[1]-1; yg <= this_xy[1]+1 && !is_edge; yg++){
				var coord_to_check = grid_to_coord(xg,yg);
				if !ds_map_exists(TERRAIN_TYPES, coord_to_check) {
					is_edge = true;
					TERRAIN_TYPES[?this_coord] = terrain_type.edge;
				}
			}
		}
		
		if !is_edge {
			TERRAIN_TYPES[?this_coord] = terrain_type.interior;
		}
	//}
}
#endregion

#region Spawn the visuals
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
	
	var sp = layer_sprite_create(WORLD_LAYER,
		world_xy[0]+irandom_range(-2,2),
		world_xy[1]+irandom_range(-2,2), sprite_to_spawn);
	
	layer_sprite_blend(sp, color_darken(c_white, random_range(.93,1)));
	ds_map_add(TILES_SPAWNED, this_coord, sp);
	ds_list_add(TILES_LIST, sp);
}

ds_priority_destroy(spawn_order);
#endregion