xspeed = lengthdir_x(fly_speed, fly_direction);
yspeed = lengthdir_y(fly_speed, fly_direction);

x += xspeed*SLOMO_SECONDS;
y += yspeed*SLOMO_SECONDS;

update_world_depth();

lifetime -= SLOMO_SECONDS;

if lifetime <= 0 {
	exploding = true;
}

if exploding {
	// Do explodey things.
	create_explosion(x,y,200);
	instance_destroy();
}

