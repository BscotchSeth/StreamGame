#region Update controller state

for ( var p = 0; p < MAX_PLAYERS; p++){
	for ( var stick = 0; stick < array_length_1d(JOYSTICK_X); stick++){
		JOYSTICK_X[p, stick] = 0;
		JOYSTICK_Y[p, stick] = 0;
	}
	
	if CURRENT_GAMEPAD[p] == -1 {
		#region Find an active controller
		for ( var gp_slot = 0; gp_slot < 5 && CURRENT_GAMEPAD[p] == -1; gp_slot++ ) {
			if gamepad_is_connected(gp_slot) {
				if !ds_list_contains(ACTIVE_GAMEPADS, gp_slot) {
					if (abs(gamepad_axis_value(gp_slot, gp_axislh)) > .5		||
						abs(gamepad_axis_value(gp_slot, gp_axislv)) > .5		||
						abs(gamepad_axis_value(gp_slot, gp_axisrh)) > .5		||
						abs(gamepad_axis_value(gp_slot, gp_axisrv)) > .5		||
						gamepad_button_check_pressed(gp_slot, gp_start)			||
						gamepad_button_check_pressed(gp_slot, gp_select)		||
						gamepad_button_check_pressed(gp_slot, gp_face1)			||
						gamepad_button_check_pressed(gp_slot, gp_face2)			||
						gamepad_button_check_pressed(gp_slot, gp_face3)			||
						gamepad_button_check_pressed(gp_slot, gp_face4)			||
						gamepad_button_check_pressed(gp_slot, gp_padd)			||
						gamepad_button_check_pressed(gp_slot, gp_padu)			||
						gamepad_button_check_pressed(gp_slot, gp_padr)			||
						gamepad_button_check_pressed(gp_slot, gp_padl)			||
						gamepad_button_check_pressed(gp_slot, gp_shoulderl)		||
						gamepad_button_check_pressed(gp_slot, gp_shoulderr)		||
						gamepad_button_check_pressed(gp_slot, gp_shoulderlb)	||
						gamepad_button_check_pressed(gp_slot, gp_shoulderrb)) {
							
							ds_list_add(ACTIVE_GAMEPADS, gp_slot);
							CURRENT_GAMEPAD[p] = gp_slot;
							gamepad_set_axis_deadzone(CURRENT_GAMEPAD[p], JOYSTICK_DEADZONE);
					}
				}
			}
		}
		#endregion
	}
	else {
		if !gamepad_is_connected(CURRENT_GAMEPAD[p]) {
			ds_list_delete_element(ACTIVE_GAMEPADS, CURRENT_GAMEPAD[p]);
			CURRENT_GAMEPAD[p] = -1;
		}
		else {
			JOYSTICK_X[p, 0] = gamepad_axis_value(CURRENT_GAMEPAD[p], gp_axislh);
			JOYSTICK_Y[p, 0] = gamepad_axis_value(CURRENT_GAMEPAD[p], gp_axislv);
			JOYSTICK_X[p, 1] = gamepad_axis_value(CURRENT_GAMEPAD[p], gp_axisrh);
			JOYSTICK_Y[p, 1] = gamepad_axis_value(CURRENT_GAMEPAD[p], gp_axisrv);
		}
	}
}
#endregion

with o_virtual_joystick {
	var joydist = point_distance(	0,0,	joystick_x,joystick_y);
	var joydir	= point_direction(	0,0,	joystick_x,joystick_y);
	
	var player_id = 0;
	if joydist > JOYSTICK_DEADZONE {
		JOYSTICK_X[player_id, 0] = joystick_x;
		JOYSTICK_Y[player_id, 0] = joystick_y;
	}
}

for ( var p = 0; p < MAX_PLAYERS; p++) {
	for ( var this_input = 0; this_input < array_height_2d(INPUT_INFO); this_input++) {
		INPUT_STATES[p, this_input] = input_state.none;
		
		#region Keyboard inputs
		if p == 0 {
			var this_keyboard_key = INPUT_INFO[this_input, input_info.keyboard];
		
			if keyboard_check_pressed(this_keyboard_key) {
				INPUT_STATES[p, this_input] = input_state.pressed;
			}
			else if keyboard_check(this_keyboard_key) {
				INPUT_STATES[p, this_input] = input_state.held;
			}
			else if keyboard_check_released(this_keyboard_key) {
				INPUT_STATES[p, this_input] = input_state.released;
			}
		}
		#endregion
	
		#region Gamepad inputs
			var this_gamepad = CURRENT_GAMEPAD[p];
			if this_gamepad >= 0 {
				var this_gamepad_button = INPUT_INFO[this_input, input_info.controller];
				if gamepad_button_check_pressed(this_gamepad, this_gamepad_button) {
					INPUT_STATES[p, this_input] = input_state.pressed;
				}
				else if gamepad_button_check(this_gamepad, this_gamepad_button) {
					INPUT_STATES[p, this_input] = input_state.held;
				}
				else if gamepad_button_check_released(this_gamepad, this_gamepad_button) {
					INPUT_STATES[p, this_input] = input_state.released;
				}
			}
		#endregion
	}
}