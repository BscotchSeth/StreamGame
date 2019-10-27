moving = false;

#region Decrease cooldowns
for ( var i = 0; i < array_length_1d(ability_cooldowns); i++){
	ability_cooldowns[i] -= SLOMO_SECONDS;
}
#endregion

if input_pressed(player_id, input_action.dash) {
	if ability_is_available(player_abilities.dash) {
		#region Perform Charge Attack
		var charge_x_attempt = mouse_x;
		var charge_y_attempt = mouse_y;
		
		var anglecheck_start = point_direction(mouse_x,mouse_y,x,y);
		
		for ( var circle_radius = 0; circle_radius <= 60 && !charging; circle_radius += 15) {
			var num_iterations = (circle_radius/5)+1;
			var angle_interval = 360/num_iterations;
		
			for ( var i = 0; i < num_iterations && !charging; i++){
				var angle_to_check = anglecheck_start+i*angle_interval;
				
				var xcheck = charge_x_attempt + lengthdir_x(circle_radius, angle_to_check);
				var ycheck = charge_y_attempt + lengthdir_y(circle_radius, angle_to_check)*GRID_RATIO;
				
				if world_pos_open(xcheck, ycheck, true) {
					charge_x_target			= xcheck;
					charge_y_target			= ycheck;
					charge_direction		= point_direction(x,y,charge_x_target,charge_y_target);
					charging				= true;
					ability_begin_cooldown(player_abilities.dash);
					camera_shake(7);
				}
			}
		}
		#endregion
	}
}

if charging {
	// Fly toward the target!
	var dist_to_target	= point_distance(x,y,charge_x_target,charge_y_target);
	var chargedist		= min(dist_to_target, charge_speed*SLOMO_SECONDS);
	
	var charge_x_end = x + lengthdir_x(chargedist, charge_direction);
	var charge_y_end = y + lengthdir_y(chargedist, charge_direction);
	
	var particle_iteration_distance = 10;
	var dist_to_next = point_distance(x,y,charge_x_end,charge_y_end);
	for ( var d = 0; d < dist_to_next; d += particle_iteration_distance) {
		part_particles_create(charge_ps,
			x+lengthdir_x(d, charge_direction)+random_range(-5,5),
			y+lengthdir_y(d, charge_direction)-z-height*.5+random_range(-5,5), charge_pt, 1);	
	}
	
	x = charge_x_end;
	y = charge_y_end;
	
	if point_distance(x,y,charge_x_target,charge_y_target) < 1 {
		charging = false;
	}
	
	var collided_flowers = ds_list_create();
	var ellipse_halfheight	= width*.5*GRID_RATIO;
	var ellipse_halfwidth	= width*.5;
	
	collision_ellipse_list(x-ellipse_halfwidth, y-ellipse_halfheight, x+ellipse_halfwidth, y+ellipse_halfheight, o_tongueflower, false, true, collided_flowers, false);
	for ( var i = 0; i < ds_list_size(collided_flowers); i++){
		with collided_flowers[|i] {
			instance_destroy();	
		}
	}
	ds_list_destroy(collided_flowers);
}
else {
	#region Keyboard Inputs
	var movement_input_x = JOYSTICK_X[player_id, 0];
	var movement_input_y = JOYSTICK_Y[player_id, 0];
	
	if (movement_input_x == 0 && movement_input_y == 0) {
		for ( var i = 0; i < array_length_1d(walk_inputs); i++) {
			if input_held(player_id, walk_inputs[i]) {
				var this_movement_direction = i*90;
				movement_input_x += lengthdir_x(1, this_movement_direction);
				movement_input_y += lengthdir_y(1, this_movement_direction);
			}
		}
	}

	if movement_input_x != 0 {
		xscale = sign(movement_input_x);
	}

	if (abs(movement_input_x) != 0 || abs(movement_input_y) != 0) {
		// Then we have given movement inputs!
		moving = true;
		
		var movement_dir = point_direction(0,0,movement_input_x,movement_input_y*GRID_RATIO);	
		var this_frame_movement_pixels = movespeed_base * SLOMO_SECONDS;
		
		world_move(this_frame_movement_pixels, movement_dir);
	
		grid_pos = world_to_grid(x,y);
	
		if z >= 0 {
			#region Player bounce
			leg_position *= -1;
			zspeed = -500;		
			squish_set(.1);
			#endregion
		}
	}
	#endregion

	if z < 0 {
		moving = true;	
	}

	update_z();
}

update_world_depth();
part_system_depth(charge_ps, depth+1);