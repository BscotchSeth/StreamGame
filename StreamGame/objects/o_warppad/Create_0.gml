// Inherit the parent event
event_inherited();
shadow_draw = false;
width		= GRID_WIDTH;
depth		+= WALKOVER_DEPTH;

destination		= location.underwater;
image_offset	= 0;
center_radius	= 64;

alarm[0] = 1;

ptm_setup();
line_ps = ptm_create_system();
line_pt = ptm_create_type();

part_system_depth(	line_ps, -y);

part_type_shape(		line_pt, pt_shape_line);
part_type_direction(	line_pt, 90, 90, 0, 0);
part_type_speed(		line_pt, 200/room_speed, 500/room_speed, 0, 0);
part_type_life(			line_pt, .5*room_speed, room_speed);
part_type_blend(		line_pt, true);
part_type_alpha3(		line_pt, 0, 1, 0);
part_type_orientation(	line_pt, 90, 90, 0, 0, 0);
part_type_size(			line_pt, .3, .5, 0, 0);