/// @arg ability_id
/// @arg name
/// @arg cooldown_max
/// @arg icon
/// @arg input

var the_ability_id			= argument0;
var ability_name			= argument1;
var ability_cooldown_max	= argument2;
var ability_icon			= argument3;
var ability_input			= argument4;

ABILITY_INFO[the_ability_id, ability_info.name]			= ability_name;
ABILITY_INFO[the_ability_id, ability_info.maxcooldown]	= ability_cooldown_max;
ABILITY_INFO[the_ability_id, ability_info.icon]			= ability_icon;
ABILITY_INFO[the_ability_id, ability_info.input]		= ability_input;