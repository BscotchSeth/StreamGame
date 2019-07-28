/// @arg color
/// @arg brightness

var the_color			= argument0;
var brightness_change	= argument1;

var r = color_get_red(the_color);
var g = color_get_green(the_color);
var b = color_get_blue(the_color);

return make_colour_rgb(
				clamp(r*brightness_change,0,255),
				clamp(g*brightness_change,0,255),
				clamp(b*brightness_change,0,255));