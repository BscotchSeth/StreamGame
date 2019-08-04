event_inherited();

height	= 114;

set_mask(100);

keyboard_inputs[0] = ord("D");
keyboard_inputs[1] = ord("W");
keyboard_inputs[2] = ord("A");
keyboard_inputs[3] = ord("S");

movespeed_base	= 400;

leg_position	= 1;

anim_timer	= 0;

var body_xoffset = sprite_get_xoffset(sp_mainchar_body);
var body_yoffset = sprite_get_yoffset(sp_mainchar_body);

bodypart_body		= 0;
bodypart_hand_left	= 1;
bodypart_head		= 2;
bodypart_head_blink	= 3;
bodypart_hand_right = 4;

anim_setup_limb(bodypart_body,			body_xoffset, body_yoffset, sp_mainchar_body, 0, 1, 1);
anim_setup_limb(bodypart_head,			80, 42, sp_mainchar_head, 0, 1, 1);
anim_setup_limb(bodypart_head_blink,	80, 42, sp_mainchar_head, 0, 1, 1);
anim_setup_limb(bodypart_hand_left,		117, 85, sp_mainchar_hand, -135, 1, -1);
anim_setup_limb(bodypart_hand_right,	31, 85, sp_mainchar_hand, -45, 1, 1);

limb_image_index[bodypart_head_blink] = 1;

for ( var i = 0; i < array_length_1d(limbs_xoffset); i++) {
	limb_distance[i]	= point_distance(body_xoffset, body_yoffset, limbs_xoffset[i], limbs_yoffset[i]);
	limb_direction[i]	= point_direction(body_xoffset, body_yoffset, limbs_xoffset[i], limbs_yoffset[i]);
	limb_xoffset[i]	= 0;
	limb_yoffset[i]	= 0;
}