var xleft	= x;
var xright	= x;
var ytop	= y;
var ybottom = y;

for ( var i = ds_list_size( instance_targets )-1; i >= 0; i--) {
	var this_target = instance_targets[|i];
	if instance_exists( this_target ) {		
		xleft	= min(xleft,	this_target.x);
		xright	= max(xright,	this_target.x);
		ytop	= min(ytop,		this_target.y);
		ybottom	= max(ybottom,	this_target.y);		
	}
	else ds_list_delete(instance_targets, i);
}

x = lerp(x, mean(xleft,xright), lerp_speed);
y = lerp(y, mean(ytop,ybottom), lerp_speed);

var base_view_width		= gui_width();
var base_view_height	= gui_height();

var edge_margin		= 500;
var target_width	= (xright-xleft);
var target_height	= (ybottom-ytop);

var new_view_height = max(base_view_height, target_height+edge_margin);
var new_view_width	= max(base_view_width,	target_width+edge_margin);

var new_view_zoom_target = max(new_view_height/base_view_height, new_view_width/base_view_width);

new_view_height = base_view_height*new_view_zoom_target;
new_view_width	= base_view_width*new_view_zoom_target;

var cur_view_width	= view_width();
var cur_view_height = view_height();
var zoom_lerp_speed = .5;

camera_set_view_size(view_camera[0], lerp(cur_view_width, new_view_width, zoom_lerp_speed), lerp(cur_view_height, new_view_height, zoom_lerp_speed));

camera_set_view_pos(view_camera[0],
	x-view_width()*.5+random_range(-shake,shake),
	y-view_height()*.5+random_range(-shake,shake));

shake = max(0, shake-30*SECONDS_SINCE_UPDATE);