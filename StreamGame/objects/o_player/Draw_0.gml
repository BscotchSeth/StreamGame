blink();
squish_update();
anim_timer += SLOMO_SECONDS;

var xdraw_base = x;
var ydraw_base = y-height*.5+z;

if charging {
	draw_sprite_ext(sp_mainchar_attack, 0, xdraw_base, ydraw_base, random_range(.7,1.4), choose(-1,1), charge_direction, c_white, 1);
}
else {
	limb_alpha[bodypart_head_blink]		= is_blinking();
	limb_image_index[bodypart_body] = 1;

	if z < -10 {
		limb_image_index[bodypart_body]	+= leg_position;	
	}

	if moving {
		#region Running Animation
		limb_xoffset_target[bodypart_head]			= -10*leg_position; //-5*sin(12*anim_timer);
		limb_yoffset_target[bodypart_head]			= 0;
		limb_xoffset_target[bodypart_hand_left]		= -15*leg_position;
		limb_xoffset_target[bodypart_hand_right]	= 15*leg_position;
		limb_yoffset_target[bodypart_hand_left]		= -5*leg_position;
		limb_yoffset_target[bodypart_hand_right]	= 5*leg_position;
		#endregion
	}
	else {
		#region Idle Animation
		limb_xoffset_target[bodypart_hand_left]		= 0;
		limb_xoffset_target[bodypart_hand_right]	= 0;
		limb_yoffset_target[bodypart_hand_left]		= 5*sin(5*anim_timer);
		limb_yoffset_target[bodypart_hand_right]	= -5*sin(5*anim_timer);

		var head_dir	= 360*anim_timer;
		var head_dist	= 6;
	
		limb_xoffset_target[bodypart_head]			= lengthdir_x(head_dist, head_dir); //-5*sin(12*anim_timer);
		limb_yoffset_target[bodypart_head]			= .75*lengthdir_y(head_dist, head_dir);
		#endregion
	}

	limb_xoffset[bodypart_head_blink]	= limb_xoffset[bodypart_head];
	limb_yoffset[bodypart_head_blink]	= limb_yoffset[bodypart_head];

	#region Draw the limbs
	var r = rotation*xscale;
	for ( var i = 0; i < array_length_1d(limb_direction); i++) {
		var this_limb_dir = limb_direction[i]+r;
		var this_limb_rot = limb_rotation_base[i]+r;
	
		limb_xoffset[i] = lerp(limb_xoffset[i], limb_xoffset_target[i], limb_lerp_speed[i]);
		limb_yoffset[i] = lerp(limb_yoffset[i], limb_yoffset_target[i], limb_lerp_speed[i]);
	
		draw_sprite_ext(limb_sprite[i], limb_image_index[i],
			xdraw_base+(lengthdir_x(limb_distance[i], this_limb_dir)+limb_xoffset[i])*xscale,
			ydraw_base+lengthdir_y(limb_distance[i], this_limb_dir)+limb_yoffset[i],
			limb_xscale[i]*xscale, limb_yscale[i], this_limb_rot*xscale, c_white, limb_alpha[i]);
	}
	#endregion

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
}