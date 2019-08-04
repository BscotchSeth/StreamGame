with o_world_element {
	var hitbox_height = width*GRID_RATIO;
	
	draw_ellipse_centered(x, y, width, hitbox_height,			c_lime, false, .25);
	draw_ellipse_centered(x, y, width, hitbox_height,			c_lime, true);
	
	draw_line_color(x-width*.5, y, x-width*.5, y-height,		c_lime, c_lime);
	draw_line_color(x+width*.5, y, x+width*.5, y-height,		c_lime, c_lime);
	draw_ellipse_centered(x, y-height, width, hitbox_height,	c_lime, true);
	//draw_rectangle_centered(x, y-height*.5, width, height, c_lime, true);
}