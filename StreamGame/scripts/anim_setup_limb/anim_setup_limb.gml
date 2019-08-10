/// @arg limb_id
/// @arg xoffset
/// @arg yoffset
/// @arg sprite
/// @arg rotation_base
/// @arg xscale
/// @arg yscale

var limb_id			= argument0;
var xoffset			= argument1;
var yoffset			= argument2;
var l_sprite		= argument3;
var rotation_base	= argument4;
var l_xscale		= argument5;
var l_yscale		= argument6;

limb_xoffset[limb_id]			= xoffset;
limb_yoffset[limb_id]			= yoffset;
limb_xoffset_target[limb_id]	= 0;
limb_yoffset_target[limb_id]	= 0;
limb_lerp_speed[limb_id]		= .35;
limb_sprite[limb_id]			= l_sprite;
limb_rotation_base[limb_id]		= rotation_base;
limb_xscale[limb_id]			= l_xscale;
limb_yscale[limb_id]			= l_yscale;
limb_image_index[limb_id]		= 0;
limb_alpha[limb_id]				= 1;
limb_distance[limb_id]			= 0;
limb_direction[limb_id]			= 0;