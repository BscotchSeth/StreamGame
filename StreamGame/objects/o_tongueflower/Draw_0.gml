anim_timer += SLOMO_SECONDS;
squish_set(.05*sin(2*anim_timer));

draw_sprite_ext(sprite_index, image_index, x, y,
	xscale*scalemod*squish_xscale,
	scalemod*squish_yscale, 0, c_white, 1);