draw_set_alpha(.2);
draw_circle_colour(x,y,radius*scale,c_white,c_white,false);
draw_set_alpha(1);
draw_circle_colour(x,y,radius*scale,c_white,c_white,true);

draw_set_alpha(.2);
draw_circle_colour(x, y, radius*.2, c_white,c_white,false);

joystick_x_visual = lerp(joystick_x_visual, joystick_x, .6);
joystick_y_visual = lerp(joystick_y_visual, joystick_y, .6);

var joystick_visualizer_x = x+joystick_x_visual*radius;
var joystick_visualizer_y = y+joystick_y_visual*radius;

draw_set_alpha(.2);
draw_circle_colour(joystick_visualizer_x, joystick_visualizer_y, radius*.2, c_white,c_white,false);
draw_set_alpha(1);
draw_circle_colour(joystick_visualizer_x, joystick_visualizer_y, radius*.2, c_white,c_white,true);
