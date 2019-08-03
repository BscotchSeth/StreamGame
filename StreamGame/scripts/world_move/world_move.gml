/// @arg move_distance
/// @arg move_direction

var move_dist	= argument0;
var move_dir	= argument1;

var xtarg = x+lengthdir_x( move_dist, move_dir );
var ytarg = y+lengthdir_y( move_dist, move_dir );

if world_pos_open(xtarg,ytarg) {
	x = xtarg;
	y = ytarg;
	return true;
}
else {
	for ( var angle_sweep = 10; angle_sweep <= 90; angle_sweep += 10) {
		for ( var dir = -1; dir <= 1; dir += 2) {
			var angle_check = move_dir + (dir*angle_sweep);
			var xcheck = x + lengthdir_x( move_dist, angle_check);	
			var ycheck = y + lengthdir_y( move_dist, angle_check);	
			
			if world_pos_open(xcheck, ycheck) {
				x = xcheck;
				y = ycheck;
				return true;
			}
		}
	}
}

return false;
