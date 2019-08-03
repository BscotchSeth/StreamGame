instance_create(o_world_background);
instance_create(o_shadowdraw);

// camera_set_view_size(view_camera[0], view_width()*5, view_height()*5);

var player_instance = instance_create(o_player, 0, 0);

instance_create(o_camera, 0, 0);

camera_set_target(player_instance);

generate_stage();

restarting_room = false;
