/// @arg x
/// @arg y
/// @arg text
/// @arg scale
/// @arg color
/// @arg [rotation=0]
/// @arg [alpha=1]
/// @arg [dropshadow_pixels=2]
/// @arg [dropshadow_color]

var xx		= argument[0];
var yy		= argument[1];
var txt		= argument[2];
var sc		= argument[3];
var col		= argument[4];
var rot		= 0;								if argument_count > 5 { rot					= argument[5]; }
var alpha	= 1;								if argument_count > 6 { alpha				= argument[6]; }
var dropshadow_pixels = 2;						if argument_count > 7 { dropshadow_pixels	= argument[7]; }
var dropshadow_color  = color_darken(col, .5);	if argument_count > 8 { dropshadow_color	= argument[8]; }

drawtext(xx, yy+dropshadow_pixels*sc, txt, sc, dropshadow_color, rot, alpha);
drawtext(xx, yy, txt, sc, col, rot, alpha);