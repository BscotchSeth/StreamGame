instance_create(o_world_background);
instance_create(o_shadowdraw);

var player_instance = instance_create(o_player, 0, 0);

instance_create(o_camera, 0, 0);

camera_set_target(player_instance);

var num_berries = 300;
var spawn_range = 2000;

repeat(num_berries) {
	var xspawn = random_range(-spawn_range, spawn_range);
	var yspawn = random_range(-spawn_range, spawn_range);
	instance_create(o_berry, xspawn, yspawn);
}