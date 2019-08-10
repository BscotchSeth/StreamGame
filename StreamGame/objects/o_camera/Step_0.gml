if instance_exists(instance_target) {
	x = lerp(x, instance_target.x, lerp_speed);
	y = lerp(y, instance_target.y, lerp_speed);
}

camera_set_view_pos(view_camera[0],
	x-view_width()*.5+random_range(-shake,shake),
	y-view_height()*.5+random_range(-shake,shake));

shake = max(0, shake-30*SECONDS_SINCE_UPDATE);