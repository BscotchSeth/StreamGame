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

globalvar INPUT_INFO;
globalvar INPUT_STATES;

input_setup(input_action.walk_right,	"Walk Right",	ord("D"),	gp_padr);
input_setup(input_action.walk_up,		"Walk Up",		ord("W"),	gp_padu);
input_setup(input_action.walk_left,		"Walk Left",	ord("A"),	gp_padl);
input_setup(input_action.walk_down,		"Walk Down",	ord("S"),	gp_padd);
input_setup(input_action.dash,			"Dash",			ord("Q"),	gp_face1);

instance_create(o_input);