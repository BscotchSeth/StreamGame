var aspect_dynamic		= 0;
var aspect_iphone_x		= 1;
var aspect_ipad			= 2;
var aspect_ultrawide	= 3;

var aspect_ratios = 0;
aspect_ratios[aspect_dynamic]	= 0;
aspect_ratios[aspect_iphone_x]	= 2.15;
aspect_ratios[aspect_ipad]		= 1.33;
aspect_ratios[aspect_ultrawide] = 3;

var aspect_ratio_test = aspect_dynamic;

var resolution_min_width	= 1920;
var resolution_min_height	= 1080;

var base_wh = resolution_min_width/resolution_min_height; // 1.777

var dispw	= display_get_width();
var disph	= display_get_height();
var cur_wh	= dispw/disph; // 16:9

if aspect_ratio_test != aspect_dynamic {
	cur_wh = aspect_ratios[aspect_ratio_test];
}

var resolution_width	= resolution_min_width;
var resolution_height	= resolution_min_height;

if (cur_wh > base_wh) {
	// In other words... The device is LONG, so we need to expand the width of the view.
	resolution_width = (resolution_min_height*cur_wh);
}
else if (cur_wh < base_wh) {
	// In other words... The device is TALL (like an ipad), so we need to expand the height of the view.
	resolution_height = (resolution_min_width/cur_wh);
}

var viewsize_multiplier = min(.9*dispw/resolution_width, .9*disph/resolution_height, 1);

for ( var r = 0; r <= room_last; r++) {
	if room_exists(r) {
		var view_index = 0;
		var this_room_camera = room_get_camera(r, view_index);
		camera_destroy(this_room_camera);
		var newcam = camera_create_view(0, 0, resolution_width, resolution_height);
		room_set_camera(r, view_index, newcam);
		room_set_viewport(r, view_index, true, 0, 0, resolution_width, resolution_height);
	}
}

surface_resize(application_surface, resolution_width, resolution_height);
display_set_gui_size(resolution_width, resolution_height);
//window_set_fullscreen(true);

window_set_size(resolution_width*viewsize_multiplier, resolution_height*viewsize_multiplier);