/// @arg x
/// @arg y
/// @arg string
/// @arg scale
/// @arg color
/// @arg [rotation=0]
/// @arg [alpha=1]

var text_xdraw	= argument[0];
var text_ydraw	= argument[1];
var text_string = argument[2];
var text_scale	= argument[3];
var text_color	= argument[4];

var text_rotation	= 0; if argument_count > 5 { text_rotation	= argument[5]; }
var text_alpha		= 1; if argument_count > 6 { text_alpha		= argument[6]; }

draw_text_transformed_color(text_xdraw, text_ydraw, text_string, text_scale, text_scale, text_rotation, text_color, text_color, text_color, text_color, text_alpha);