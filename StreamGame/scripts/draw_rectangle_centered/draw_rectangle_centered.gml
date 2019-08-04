/// @arg xcenter
/// @arg ycenter
/// @arg width
/// @arg height
/// @arg color
/// @arg outline
/// @arg [alpha=1]

var xcenter = argument[0];
var ycenter = argument[1];
var wd		= argument[2]*.5;
var ht		= argument[3]*.5;
var col		= argument[4];
var outline	= argument[5];
var rec_alpha	= 1;

if argument_count > 6 {
	rec_alpha = argument[6]; 
	draw_set_alpha(rec_alpha);
}

draw_rectangle_colour(xcenter-wd, ycenter-ht, xcenter+wd, ycenter+ht, col, col, col, col, outline);

draw_set_alpha(1);