var dash_cooldown_percentage	= 1;
var icon_color					= c_white;
var text_color					= c_softgreen;
var border_color				= c_white;

var this_ability				= ability_id;

with o_player {
	if (ability_cooldowns[this_ability] > 0) {
		text_color		= c_gray;
		icon_color		= c_dkgray;
		border_color	= c_black;
		dash_cooldown_percentage = 1-(ability_cooldowns[this_ability]/ABILITY_INFO[this_ability, ability_info.maxcooldown]);
	}
}

if dash_cooldown_percentage < 1 {
	var circle_radius = width*.5*scale*dash_cooldown_percentage;
	draw_circle_colour(x, y, circle_radius, c_softgreen, c_softgreen, false);
}

draw_sprite_ext(sp_button_ability_backdrop, 0, x, y, scale, scale, 0, border_color, 1);
draw_sprite_ext(ABILITY_INFO[ability_id, ability_info.icon],	0, x, y, scale, scale, 0, icon_color, 1);

var the_ability_input			= ABILITY_INFO[ability_id, ability_info.input];
var the_ability_keyboard_key	= INPUT_INFO[the_ability_input, input_info.keyboard];
hotkey_display = chr(the_ability_keyboard_key);

font_set( fnt_reg, fa_right, fa_bottom );
shadowtext(x+width*.5*scale, y+(height*.5+4)*scale, hotkey_display, scale, text_color, 0, 1, 4, color_darken(text_color, .2));