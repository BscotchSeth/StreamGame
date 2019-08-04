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

update_z();

update_world_depth();