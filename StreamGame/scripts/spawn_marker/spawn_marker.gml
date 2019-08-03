/// @arg x
/// @arg y
/// @arg color
/// @arg radius
/// @arg lifetime

var _x			= argument0;
var _y			= argument1;
var _color		= argument2;
var _radius		= argument3;
var _lifetime	= argument4;

with instance_create(o_marker, _x, _y) {
	lifetime	= _lifetime;
	radius		= _radius;
	color		= _color;
}