/// @arg world_x
/// @arg world_y

var xx = argument0;
var yy = argument1;

var xy = 0;

xy[0] = round(.5*((xx/(GRID_WIDTH*.5)-(yy/(GRID_HEIGHT*.5)))));
xy[1] = round(.5*((xx/(GRID_WIDTH*.5)+(yy/(GRID_HEIGHT*.5)))));

return xy;