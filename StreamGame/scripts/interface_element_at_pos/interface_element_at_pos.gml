/// @arg x
/// @arg y

var xx = argument0;
var yy = argument1;

var closest_depth = 1000000;
var closest_element = noone;

with o_interface_element {
	var at_position = false;
	
	if point_distance(xx,yy,x,y) < radius {
		at_position = true;
	}
	else if point_in_rectangle(xx, yy, x-width*.5, y-height*.5, x+width*.5, y+height*.5) {
		at_position = true;
	}
	
	if at_position {
		if depth < closest_depth {
			closest_depth = depth;
			closest_element = id;
		}
	}
}

return closest_element;