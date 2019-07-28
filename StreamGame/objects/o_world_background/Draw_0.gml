draw_fullscreen_color(rgb(31,59,110), 1, rgb(18,12,43));

var detritus_camera_influence	= [.9, .7];
var detritus_scales				= [.6, 1];

detritus_xspeed = 80+40*sin(3*GAME_SECONDS_PASSED);
detritus_yspeed = 50+20*sin(3*GAME_SECONDS_PASSED);

for ( var i = 0; i < array_length_1d(detritus_camera_influence); i++){
	detritus_x[i] += detritus_xspeed*SLOMO_SECONDS;
	detritus_y[i] += detritus_yspeed*SLOMO_SECONDS;
	
	draw_sprite_tiled_ext(sp_bg_detritus, 0,
		(view_center_x()*detritus_camera_influence[i])+detritus_x[i]*(1-detritus_camera_influence[i]),
		(view_center_y()*detritus_camera_influence[i])+detritus_y[i]*(1-detritus_camera_influence[i]),
		detritus_scales[i],
		detritus_scales[i],
		c_white,1);
}
