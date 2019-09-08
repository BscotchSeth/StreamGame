var xdraw = x+shake_get();
var ydraw = y+shake_get();

draw_sprite_ext(sprite_index, image_offset, xdraw, ydraw, 1, 1, 0, c_white, 1);

var glow_alpha = .5+.5*sin(2*GAME_SECONDS_PASSED+destination);

gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, image_offset+1, xdraw, ydraw, 1, 1, 0, c_white, glow_alpha);
gpu_set_blendmode(bm_normal);

shake_update();