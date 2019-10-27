enum input_action {
	walk_right,
	walk_up,
	walk_left,
	walk_down,
	dash,
	bomb
}

enum input_info {
	name,
	controller,
	keyboard,
	controller_default,
	keyboard_default,
	state
}

enum input_state {
	none,
	pressed,
	held,
	released
}

globalvar CURRENT_GAMEPAD; CURRENT_GAMEPAD = 0;
globalvar ACTIVE_GAMEPADS; ACTIVE_GAMEPADS = ds_list_create();
globalvar INPUT_INFO;
globalvar INPUT_STATES;
globalvar JOYSTICK_DEADZONE; JOYSTICK_DEADZONE = .2;
globalvar JOYSTICK_X;
globalvar JOYSTICK_Y;
globalvar MAX_PLAYERS; MAX_PLAYERS = 8;

for ( var p = 0; p < MAX_PLAYERS; p++) {
	CURRENT_GAMEPAD[p] = -1;
	for (var stick = 0; stick <= 1; stick++) {
		JOYSTICK_X[p, stick]	= 0;
		JOYSTICK_Y[p, stick]	= 0;
	}
}

input_setup(input_action.walk_right,	"Walk Right",	ord("D"),	gp_padr);
input_setup(input_action.walk_up,		"Walk Up",		ord("W"),	gp_padu);
input_setup(input_action.walk_left,		"Walk Left",	ord("A"),	gp_padl);
input_setup(input_action.walk_down,		"Walk Down",	ord("S"),	gp_padd);
input_setup(input_action.dash,			"Dash",			ord("Q"),	gp_face1);
input_setup(input_action.bomb,			"Bomb",			ord("E"),	gp_face2);

instance_create(o_input);