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