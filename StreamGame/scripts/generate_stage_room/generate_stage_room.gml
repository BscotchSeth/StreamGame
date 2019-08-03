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
			set_terrain_at_pos(xg, yg, terrain_type.interior);
		}
	}
}

var room_xy = grid_to_world(room_center_xg, room_center_yg);

instance_create(o_berry, room_xy[0], room_xy[1]);