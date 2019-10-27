event_inherited();

width			= 70;
height			= 70;
set_mask(width);

z				= 60;
max_speed		= 600;
max_distance	= 600;
xspeed			= 0;
yspeed			= 0;
exploding		= false;
lifetime		= max_distance/max_speed;
lifetime_max	= lifetime;

fly_direction	= 0;
fly_speed		= max_speed;

image_index		= 0;
blink_cooldown	= .2;
blink_maxcool	= .2;