/*
Create a system where we can generate "rooms"
a "room" is just a chunk of terrain floating in the world
Rooms are connected by "hallways" or "bridges"
*/

clear_world_tiles();
create_stage_layers();

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

update_terrain_edges();
spawn_terrain_visuals();
spawn_stage_random_objects();









