/// @arg player_id
/// @arg input_id

var pid			= argument0;
var the_input	= argument1;

return INPUT_STATES[pid, the_input] == input_state.released;