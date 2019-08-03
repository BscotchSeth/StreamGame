width		= 30;
height		= 30;
shadow_draw = true;

grid_pos = world_to_grid(x,y);

z			= 0;
zspeed		= 0;
rotation	= 0;
xscale		= 1;
scalemod	= 1;

init_blinking();
squish_init();
update_world_depth();