lifetime -= SECONDS_SINCE_UPDATE;
scale = lerp(scale, 1, .35);
alpha = lifetime*2;

draw_sprite_ext(sprite_index, 0, x, y, scale, scale, 0, color, alpha);

if lifetime <= 0 {
	instance_destroy();	
}