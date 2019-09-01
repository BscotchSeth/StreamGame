/// @arg input_id
/// @arg name
/// @arg keyboard_key
/// @arg controller_button

var input_id			= argument0;
var input_name			= argument1;
var input_kb			= argument2;
var input_controller	= argument3;

INPUT_INFO[input_id, input_info.name]				= input_name;
INPUT_INFO[input_id, input_info.keyboard]			= input_kb;
INPUT_INFO[input_id, input_info.controller]			= input_controller;
INPUT_INFO[input_id, input_info.keyboard_default]	= input_kb;
INPUT_INFO[input_id, input_info.controller_default]	= input_controller;

INPUT_STATES[input_id] = input_state.none;
