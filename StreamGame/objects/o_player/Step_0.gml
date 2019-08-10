moving = false;

#region Charge Attack Input
if mouse_check_button_pressed(mb_left) {
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
				charge_x_target = xcheck;
				charge_y_target = ycheck;
				charge_direction = point_direction(x,y,charge_x_target,charge_y_target);
				charging		= true;
			}
		}
	}
}
#endregion

if charging {
	// Fly toward the target!
	var dist_to_target	= point_distance(x,y,charge_x_target,charge_y_target);
	var chargedist		= min(dist_to_target, charge_speed*SLOMO_SECONDS);
	x += lengthdir_x(chargedist, charge_direction);
	y += lengthdir_y(chargedist, charge_direction);
	
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
	var movement_input_x = 0;
	var movement_input_y = 0;

	for ( var i = 0; i < array_length_1d(keyboard_inputs); i++) {
		if keyboard_check(keyboard_inputs[i]) {
			var this_movement_direction = i*90;
			movement_input_x += lengthdir_x(1, this_movement_direction);
			movement_input_y += lengthdir_y(1, this_movement_direction);
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