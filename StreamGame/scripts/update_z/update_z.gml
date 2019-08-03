var was_off_ground = z < 0;

z += zspeed*SLOMO_SECONDS;
zspeed += GRAVITY_THIS_FRAME;

z = min(z, 0);

if z >= 0 && was_off_ground {
	var widthcheck = width*.5;
	
	for ( var dir = 0; dir < 360; dir += 45) {
		var xcheck = x + lengthdir_x(widthcheck, dir);
		var ycheck = y + lengthdir_y(widthcheck, dir)*GRID_RATIO;
		var world_pos = world_to_grid(xcheck, ycheck);
		tile_set_z(world_pos[0], world_pos[1], 10);	
	}
}