/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(alpha);
draw_set_colour(make_color_rgb(255,128,0));
//Draw the circle with width 8
draw_circle(x,y,scale,true);
draw_circle(x,y,scale+1,true);
draw_circle(x,y,scale+2,true);
draw_circle(x,y,scale+3,true);
draw_circle(x,y,scale-1,true);
draw_circle(x,y,scale-2,true);
draw_circle(x,y,scale-3,true);
draw_circle(x,y,scale-4,true);
draw_set_colour(c_white);
draw_set_alpha(1);