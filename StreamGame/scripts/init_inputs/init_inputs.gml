enum input_action {
	walk_right,
	walk_up,
	walk_left,
	walk_down,
	dash
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

globalvar CURRENT_GAMEPAD;	CURRENT_GAMEPAD = -1;
globalvar INPUT_INFO;
globalvar INPUT_STATES;
globalvar JOYSTICK_DEADZONE; JOYSTICK_DEADZONE = .2;
globalvar JOYSTICK_X;
globalvar JOYSTICK_Y;

for (var stick = 0; stick <= 1; stick++){
	JOYSTICK_X[stick]	= 0;
	JOYSTICK_Y[stick]	= 0;
}

input_setup(input_action.walk_right,	"Walk Right",	ord("D"),	gp_padr);
input_setup(input_action.walk_up,		"Walk Up",		ord("W"),	gp_padu);
input_setup(input_action.walk_left,		"Walk Left",	ord("A"),	gp_padl);
input_setup(input_action.walk_down,		"Walk Down",	ord("S"),	gp_padd);
input_setup(input_action.dash,			"Dash",			ord("Q"),	gp_face1);

instance_create(o_input);