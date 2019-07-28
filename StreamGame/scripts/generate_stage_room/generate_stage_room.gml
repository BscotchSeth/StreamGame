/// @arg room_center_xg
/// @arg room_center_yg
/// @arg room_radius

var room_center_xg	= argument0;
var room_center_yg	= argument1;
var room_radius		= argument2;

ds_list_add(ROOM_CENTERS, [room_center_xg, room_center_yg]);

for ( var xg = room_center_xg-room_radius; xg <= room_center_xg+room_radius; xg++){
	for ( var yg = room_center_yg+room_radius; yg >= room_center_yg-room_radius; yg--){
		// NOW WHAT DO WE DO?
		if point_distance(xg, yg, room_center_xg, room_center_yg) <= room_radius {
			layer_sprite_create(WORLD_LAYER, grid_to_x(xg), grid_to_y(yg), sp_tl_dirt);
		}
	}
}

instance_create(o_berry, grid_to_x(room_center_xg), grid_to_y(room_center_yg));