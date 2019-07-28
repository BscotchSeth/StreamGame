/*
Create a system where we can generate "rooms"
a "room" is just a chunk of terrain floating in the world
Rooms are connected by "hallways" or "bridges"
*/

WORLD_LAYER = layer_create(TERRAIN_DEPTH);

ds_list_clear(ROOM_CENTERS);

var num_rooms		= irandom_range(5,10);
var room_min_radius	= 3;
var room_max_radius	= 7;

var room_xg = 0;
var room_yg = 0;

var room_radius = irandom_range(room_min_radius,room_max_radius);

#region Set the locations of the rooms
while ds_list_size(ROOM_CENTERS) < num_rooms {
	var this_room_center = [room_xg, room_yg];

	generate_stage_room(room_xg, room_yg, room_radius);
	
	var new_room_radius		= irandom_range(room_min_radius,room_max_radius);
	var new_room_direction	= irandom(359);
	var bridge_length		= irandom_range(2,5);
	var new_room_distance_from_current_room	= room_radius + new_room_radius + bridge_length;
	
	room_radius = new_room_radius;
	room_xg = round(room_xg + lengthdir_x(new_room_distance_from_current_room, new_room_direction));
	room_yg = round(room_yg + lengthdir_y(new_room_distance_from_current_room, new_room_direction));
}
#endregion

#region Update terrain types for edges
for ( var i = 0; i < ds_list_size(TERRAIN_LOCATIONS); i++){
	var this_coord = TERRAIN_LOCATIONS[|i];
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
}
#endregion

#region Spawn the visuals
var spawn_order = ds_priority_create();
for ( var i = 0; i < ds_list_size(TERRAIN_LOCATIONS); i++){
	var this_coord = TERRAIN_LOCATIONS[|i];
	var this_xy = coord_to_grid(this_coord);
	var this_yg = this_xy[1];
	ds_priority_add(spawn_order, this_coord, this_yg);
}

while !ds_priority_empty(spawn_order) {
	var this_coord = ds_priority_delete_max(spawn_order);
	var this_xy = coord_to_grid(this_coord);
	var sprite_to_spawn = sp_tl_dirt;
	
	if TERRAIN_TYPES[?this_coord] == terrain_type.edge {
		sprite_to_spawn = sp_tl_edge;
	}
	
	var sp = layer_sprite_create(WORLD_LAYER,
		grid_to_x(this_xy[0])+irandom_range(-2,2),
		grid_to_y(this_xy[1])+irandom_range(-2,2), sprite_to_spawn);
	
	layer_sprite_blend(sp, color_darken(c_white, random_range(.93,1)));
}

ds_priority_destroy(spawn_order);
#endregion