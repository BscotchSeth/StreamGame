/// @arg color
/// @arg [alpha]
/// @arg [bottom_color]

var color = argument[0];

var alpha = 1;				if argument_count > 1 { alpha = argument[1]; }
var bottom_color = color;	if argument_count > 2 { bottom_color = argument[2]; }

draw_set_alpha(alpha);
draw_rectangle_colour(view_xview()-5, view_yview()-5, view_right()+5, view_bottom()+5, color, color, bottom_color, bottom_color, false);
draw_set_alpha(1);