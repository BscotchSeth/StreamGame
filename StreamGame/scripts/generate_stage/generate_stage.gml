/*
Create a system where we can generate "rooms"
a "room" is just a chunk of terrain floating in the world
Rooms are connected by "hallways" or "bridges"
*/

var num_rooms		= irandom_range(5,10);
var room_min_radius	= 3;
var room_max_radius	= 7;

var room_centers = ds_list_create();

var room_start_xg = 0;
var room_start_yg = 0;

var world_layer = layer_create(100);

var this_room_radius = irandom_range(room_min_radius,room_max_radius);
for ( var xg = room_start_xg-this_room_radius; xg <= room_start_xg+this_room_radius; xg++){
	for ( var yg = room_start_yg+this_room_radius; yg >= room_start_yg-this_room_radius; yg--){
		// NOW WHAT DO WE DO?
		layer_sprite_create(world_layer, grid_to_x(xg), grid_to_y(yg), sp_tl_dirt);
	}
}


ds_list_destroy(room_centers);