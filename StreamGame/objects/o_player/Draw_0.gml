blink();
squish_update();
anim_timer += SLOMO_SECONDS;

var xdraw_base = x;
var ydraw_base = y-height*.5+z;

limb_alpha[bodypart_head_blink]		= is_blinking();

limb_yoffset[bodypart_hand_left]	= 5*sin(5*anim_timer);
limb_yoffset[bodypart_hand_right]	= -5*sin(5*anim_timer);

var head_dir	= 360*anim_timer;
var head_dist	= 6;

limb_xoffset[bodypart_head]			= lengthdir_x(head_dist, head_dir); //-5*sin(12*anim_timer);
limb_yoffset[bodypart_head]			= .75*lengthdir_y(head_dist, head_dir);
limb_xoffset[bodypart_head_blink]	= limb_xoffset[bodypart_head];
limb_yoffset[bodypart_head_blink]	= limb_yoffset[bodypart_head];

for ( var i = 0; i < array_length_1d(limb_direction); i++){
	var this_limb_dir = limb_direction[i]+rotation;
	var this_limb_rot = limb_rotation_base[i]+rotation;
	
	draw_sprite_ext(limb_sprite[i], limb_image_index[i],
		xdraw_base+lengthdir_x(limb_distance[i], this_limb_dir)+limb_xoffset[i],
		ydraw_base+lengthdir_y(limb_distance[i], this_limb_dir)+limb_yoffset[i],
		limb_xscale[i], limb_yscale[i], this_limb_rot, c_white, limb_alpha[i]);
}

var rotation_target = 0;
var rotation_speed = .45;

if z >= 0 {
	rotation_target = 0;
}
else {
	if zspeed < 0 {
		rotation_target = 10*leg_position;
	}
	else {
		rotation_speed = .05;
		rotation_target = 0;
	}
}

rotation = lerp(rotation, rotation_target, rotation_speed);	