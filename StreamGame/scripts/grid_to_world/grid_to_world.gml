/// @arg xg;
/// @arg yg;

var xg = argument0;
var yg = argument1;

var xy = 0;

xy[0] = (xg+yg)*(GRID_WIDTH)*.5;	// Our world X position
xy[1] = (-xg+yg)*(GRID_HEIGHT)*.5;	// Our world Y position

return xy;
