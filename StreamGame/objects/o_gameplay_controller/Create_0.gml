instance_create(o_world_background);
instance_create(o_shadowdraw);

// camera_set_view_size(view_camera[0], view_width()*5, view_height()*5);

instance_create(o_camera, 0, 0);
spawn_player(0,0,0);

switch CURRENT_LOCATION {
	case location.farm:
		generate_farm();
		break;
	default:
		generate_stage();
		break;
}

restarting_room = false;

if debug_mode {
	instance_create(o_hitbox_draw);	
}

instance_create(o_gameplay_interface);