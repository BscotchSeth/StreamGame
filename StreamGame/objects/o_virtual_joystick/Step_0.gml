joystick_x = 0;
joystick_y = 0;

if touch_device == -1 {
	for (var d = 0; d < 5 && touch_device == -1; d++){
		if device_mouse_check_button(d, mb_left) {
			var dx = device_mouse_x_to_gui(d);
			var dy = device_mouse_y_to_gui(d);
			
			if (point_distance(x,y,dx,dy) < radius) {
				touch_device = d;
			}
		}
	}
}

if touch_device != -1 {
	if !device_mouse_check_button(touch_device, mb_left) {
		touch_device = -1;
	}
	else {
		scale = lerp(scale, 1, .4);
		
		var dx = device_mouse_x_to_gui(touch_device);
		var dy = device_mouse_y_to_gui(touch_device);
		
		var joystick_dir	= point_direction(x,y,dx,dy);
		var joystick_dist	= min(point_distance(x,y,dx,dy)/radius, 1);
		
		joystick_x = lengthdir_x(joystick_dist, joystick_dir);
		joystick_y = lengthdir_y(joystick_dist, joystick_dir);
	}
}
else scale = lerp(scale, .7, .4);