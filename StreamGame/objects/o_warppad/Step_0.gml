var player_is_standing_on_me = false;
var this_warp_pad = id;

with o_player {
	if grid_pos[0] == this_warp_pad.grid_pos[0] && grid_pos[1] == this_warp_pad.grid_pos[1] {
		player_is_standing_on_me = true;
		shake = 3;
	}
}

if player_is_standing_on_me {
	shake = 3;
	warp_timer += SLOMO_SECONDS;
	if warp_timer >= warp_maxtime {
		// SEND THE PLAYER TO SOMEWHERE.
		CURRENT_LOCATION	= destination;
		CURRENT_STAGE_LEVEL = 0;
		room_goto(rm_gameplay);
	}
}
else warp_timer = 0;

var particle_spawn_distance  = random_range(0,center_radius);
var particle_spawn_direction = random_range(0,360);

part_particles_create(line_ps,
	x+lengthdir_x(particle_spawn_distance, particle_spawn_direction),
	y+lengthdir_y(particle_spawn_distance, particle_spawn_direction)*GRID_RATIO-10, line_pt, 1);