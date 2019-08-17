var dash_cooldown_percentage	= 1;
var icon_color					= c_white;
var text_color					= c_softgreen;
var border_color				= c_white;

with o_player {
	if (dash_attack_cooldown > 0) {
		text_color		= c_gray;
		icon_color		= c_dkgray;
		border_color	= c_black;
		dash_cooldown_percentage = 1-(dash_attack_cooldown/dash_attack_maxcool);
	}
}

if dash_cooldown_percentage < 1 {
	var circle_radius = width*.5*scale*dash_cooldown_percentage;
	draw_circle_colour(x, y, circle_radius, c_softgreen, c_softgreen, false);
}

draw_sprite_ext(sp_button_ability_backdrop, 0, x, y, scale, scale, 0, border_color, 1);
draw_sprite_ext(sp_icon_spinattack,			0, x, y, scale, scale, 0, icon_color, 1);


font_set( fnt_reg, fa_right, fa_bottom );
shadowtext(x+width*.5*scale, y+(height*.5+4)*scale, hotkey_display, scale, text_color, 0, 1, 4, color_darken(text_color, .2));