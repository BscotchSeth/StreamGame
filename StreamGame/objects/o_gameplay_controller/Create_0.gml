instance_create(o_world_background);
instance_create(o_shadowdraw);

var player_instance = instance_create(o_player, 0, 0);

instance_create(o_camera, 0, 0);

camera_set_target(player_instance);

generate_stage();

restarting_room = false;