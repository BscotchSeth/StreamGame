font_set(fnt_header, fa_center, fa_middle);

#region Backdrop
var game_seconds	= 3*get_timer()/1000000;

var text_xdraw		= display_get_gui_width()*.5+10*sin(5*game_seconds);
var text_ydraw		= 200+10*sin(7.8*game_seconds);
var text_rotation	= 10*sin(2.3*game_seconds);

drawtext(text_xdraw, text_ydraw, game_title, 1, c_softblue, text_rotation);
#endregion

#region Foreground
game_seconds	+= .2;

text_xdraw		= display_get_gui_width()*.5+10*sin(5*game_seconds);
text_ydraw		= 200+10*sin(7.8*game_seconds);
text_rotation	= 10*sin(2.3*game_seconds);

drawtext(text_xdraw, text_ydraw, game_title, 1, c_softyellow, text_rotation);
#endregion

font_set(fnt_reg, fa_center, fa_middle);
var helper_text_scale = .9+.1*sin(16*get_timer()/1000000)

drawtext(gui_center_x(), gui_height()*.75, "Press space to tango.", helper_text_scale, c_white);