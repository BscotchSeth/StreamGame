blink();
squish_update();

draw_sprite_ext(sprite_index, is_blinking(), x,
	y-height*.5*squish_yscale+z,
	xscale*squish_xscale,
	squish_yscale, rotation, c_white, 1);
	
if z >= 0 {
	rotation = lerp(rotation, 0, .35);	
}
else rotation = lerp(rotation, 0, .05);