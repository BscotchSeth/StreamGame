instance_create(o_world_background);
instance_create(o_shadowdraw);

var player_instance = instance_create(o_player, 0, 0);

instance_create(o_camera, 0, 0);

camera_set_target(player_instance);

var berry_spawn_chance	= .05;

for ( var xg = -100; xg <= 100; xg++){ 
	for ( var yg = -100; yg <= 100; yg++){ 
		if random(1) <= berry_spawn_chance {
			instance_create(o_berry, grid_to_x(xg), grid_to_y(yg));	
		}
	}	
}
