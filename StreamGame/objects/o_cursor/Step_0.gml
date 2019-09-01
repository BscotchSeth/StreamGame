if room == rm_gameplay {
	if mouse_check_button_pressed(mb_left) {
		var dx = device_mouse_x_to_gui(0);
		var dy = device_mouse_y_to_gui(0);
		
		if interface_element_at_pos(dx,dy) == noone {
			spawn_world_ping(CURSOR_XWORLD, CURSOR_YWORLD);
		}
	}
}