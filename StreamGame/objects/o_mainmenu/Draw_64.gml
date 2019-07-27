font_set(fnt_header, fa_center, fa_middle);

#region Backdrop
var game_seconds	= 3*get_timer()/1000000;

var text_xdraw		= display_get_gui_width()*.5+10*sin(5*game_seconds);
var text_ydraw		= 200+10*sin(7.8*game_seconds);
var text_rotation	= 10*sin(2.3*game_seconds);

draw_text_transformed_color(text_xdraw, text_ydraw, "STREAM GAME", 1, 1, text_rotation, c_softblue, c_softblue, c_softblue, c_softblue, 1);
#endregion

#region Foreground
game_seconds	+= .2;

text_xdraw		= display_get_gui_width()*.5+10*sin(5*game_seconds);
text_ydraw		= 200+10*sin(7.8*game_seconds);
text_rotation	= 10*sin(2.3*game_seconds);

draw_text_transformed_color(text_xdraw, text_ydraw, "STREAM GAME", 1, 1, text_rotation, c_softyellow, c_softyellow, c_softyellow, c_softyellow, 1);
#endregion