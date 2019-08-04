/// @arg coord

var coord = argument0;

var grid_xy		= coord_to_grid(coord);
var world_xy	= grid_to_world(grid_xy[0], grid_xy[1]);

return world_xy;