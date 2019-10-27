event_inherited();

player_id	= 0;
height		= 114;

set_mask(100);

#region Abilities
for (var i = 0; i < array_height_2d(ABILITY_INFO); i++){
	ability_cooldowns[i] = 0;
}
#endregion

walk_inputs[0] = input_action.walk_right;
walk_inputs[1] = input_action.walk_up;
walk_inputs[2] = input_action.walk_left;
walk_inputs[3] = input_action.walk_down;

movespeed_base	= 400;

leg_position	= 1;

moving			= false;

charge_direction	= 0;
charge_speed		= 3000;
charge_x_target		= x;
charge_y_target		= y;
charging			= false;

charge_ps = ptm_create_system(id);
charge_pt = ptm_create_type(charge_ps);

part_type_sprite(		charge_pt,	sp_particles_magic, false, false, true);
part_type_color2(		charge_pt,  rgb(30,100,255), rgb(255,100,20));
part_type_life(			charge_pt,	.2*room_speed, .35*room_speed);
part_type_alpha2(		charge_pt,  1, 0);
part_type_size(			charge_pt,	.8, 1, -.02, 0);
part_type_speed(		charge_pt,	50/room_speed, 100/room_speed, 0, 0);
part_type_direction(	charge_pt,	0, 359, 360/room_speed, 0);
part_type_blend(		charge_pt,	true);
part_type_orientation(	charge_pt,	0, 359, 360/room_speed, 0, false);
#region Animations
anim_timer	= 0;

var body_xoffset = sprite_get_xoffset(sp_mainchar_body);
var body_yoffset = sprite_get_yoffset(sp_mainchar_body);

bodypart_hand_left	= 0;
bodypart_body		= 1;
bodypart_head		= 2;
bodypart_head_blink	= 3;
bodypart_hand_right = 4;

anim_setup_limb(bodypart_body,			body_xoffset, body_yoffset, sp_mainchar_body, 0, 1, 1);
anim_setup_limb(bodypart_head,			80, 42, sp_mainchar_head, 0, 1, 1);
anim_setup_limb(bodypart_head_blink,	80, 42, sp_mainchar_head, 0, 1, 1);
anim_setup_limb(bodypart_hand_left,		117, 80, sp_mainchar_hand, -135, 1, -1);
anim_setup_limb(bodypart_hand_right,	31, 80, sp_mainchar_hand, -45, 1, 1);

limb_image_index[bodypart_head_blink] = 1;

for ( var i = 0; i < array_length_1d(limb_xoffset); i++) {
	limb_distance[i]	= point_distance(body_xoffset, body_yoffset, limb_xoffset[i], limb_yoffset[i]);
	limb_direction[i]	= point_direction(body_xoffset, body_yoffset, limb_xoffset[i], limb_yoffset[i]);
	limb_xoffset[i]	= 0;
	limb_yoffset[i]	= 0;
}
#endregion