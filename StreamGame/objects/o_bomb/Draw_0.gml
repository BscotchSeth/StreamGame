if blink_maxcool <= 1/room_speed {
	image_index = 1;
}
else {
	blink_cooldown	-= SLOMO_SECONDS;
	if blink_cooldown <= 0 {
		blink_maxcool *= .75;
		blink_cooldown = blink_maxcool;
		image_index		= !image_index;
	}
}

draw_sprite_ext(sprite_index, image_index, x, y-z, 1, 1, 0, c_white, 1);