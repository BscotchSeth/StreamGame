instance_create(o_world_background);
instance_create(o_shadowdraw);

instance_create(o_player, view_center_x(), view_center_y());

var num_berries = 300;
var spawn_range = 2000;

repeat(num_berries) {
	var xspawn = random_range(-spawn_range, spawn_range);
	var yspawn = random_range(-spawn_range, spawn_range);
	instance_create(o_berry, xspawn, yspawn);
}