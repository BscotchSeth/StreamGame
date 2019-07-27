blink();

draw_sprite_ext(sp_shadow, 0, x, y, 1, 1, 0, c_white, .25);

draw_sprite_ext(sprite_index, is_blinking(), x, y-height*.5, xscale, 1, 0, c_white, 1);