enum player_abilities {
	dash,
	bomb
}

enum ability_info {
	name,
	maxcooldown,
	icon,
	input
}

globalvar ABILITY_INFO; ABILITY_INFO = 0;

setup_player_ability(player_abilities.dash, "Dash", 1,	sp_icon_spinattack, input_action.dash);
setup_player_ability(player_abilities.bomb, "Bomb", .5, sp_bomb,			input_action.bomb);