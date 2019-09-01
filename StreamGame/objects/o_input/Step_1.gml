for ( var this_input = 0; this_input < array_height_2d(INPUT_INFO); this_input++){
	INPUT_STATES[this_input] = input_state.none;
	
	if keyboard_check_pressed(INPUT_INFO[this_input, input_info.keyboard]) {
		INPUT_STATES[this_input] = input_state.pressed;
	}
	else if keyboard_check(INPUT_INFO[this_input, input_info.keyboard]) {
		INPUT_STATES[this_input] = input_state.held;
	}
	else if keyboard_check_released(INPUT_INFO[this_input, input_info.keyboard]) {
		INPUT_STATES[this_input] = input_state.released;
	}
}