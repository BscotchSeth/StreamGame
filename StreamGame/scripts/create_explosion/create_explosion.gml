/// @arg explosion_x
/// @arg explosion_y
/// @arg explosion_radius

var explosion_x			= argument0;
var explosion_y			= argument1;
var explosion_radius	= argument2;

var explosion_height	= explosion_radius*GRID_RATIO;

var things_exploded = ds_list_create();

var explosion_left		= explosion_x-explosion_radius;
var explosion_right		= explosion_x+explosion_radius;
var explosion_top		= explosion_y-explosion_height;
var explosion_bottom	= explosion_y+explosion_height;

collision_ellipse_list(explosion_left, explosion_top, explosion_right, explosion_bottom, o_tongueflower, false, true, things_exploded, false);

for ( var i = 0; i < ds_list_size(things_exploded); i++){
	with things_exploded[|i] {
		instance_destroy();	
	}
}

ds_list_destroy(things_exploded);

for ( var marker_spawn_dir = 0; marker_spawn_dir < 360; marker_spawn_dir += 10) {
	spawn_marker(
		explosion_x+lengthdir_x(explosion_radius, marker_spawn_dir),
		explosion_y+lengthdir_y(explosion_height, marker_spawn_dir),
		c_orange, 5, .5);
}

camera_shake(8);