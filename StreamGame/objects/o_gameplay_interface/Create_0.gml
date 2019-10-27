var button_margin = 5;

for ( var i = 0; i < array_height_2d(ABILITY_INFO); i++) {
	with instance_create(o_ability_icon) {
		ability_id = i;
		x = gui_center_x()+width*i;
		y = gui_height()-height*.5-button_margin;
	}	
}

instance_create(o_virtual_joystick);