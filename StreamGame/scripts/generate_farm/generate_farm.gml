/*
Create a system where we can generate "rooms"
a "room" is just a chunk of terrain floating in the world
Rooms are connected by "hallways" or "bridges"
*/

clear_world_tiles();
create_stage_layers();

generate_stage_room(0,0,20);
update_terrain_edges();
spawn_terrain_visuals();

var warppad_center_x = 0;
var warppad_center_y = 0;

with instance_create(o_warppad, warppad_center_x+GRID_WIDTH, warppad_center_y) {
	destination = location.space;	
}
with instance_create(o_warppad, warppad_center_x-GRID_WIDTH, warppad_center_y) {
	destination = location.cave;	
}
with instance_create(o_warppad, warppad_center_x, warppad_center_y+GRID_HEIGHT) {
	destination = location.underwater;	
}