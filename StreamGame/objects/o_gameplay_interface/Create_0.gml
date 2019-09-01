var button_margin = 5;
with instance_create(o_ability_icon) {
	x = gui_center_x();
	y = gui_height()-height*.5-button_margin;
}

instance_create(o_virtual_joystick);