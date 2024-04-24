/// @description Insert description here
// You can write your code in this editor

hud_left = window_get_width()-hud_width;
hud_right = window_get_width();
hud_mid = (hud_left+hud_right)/2;

draw_rectangle_color(hud_left, 0, hud_right, window_get_height(),
	c_dkgray,c_dkgray,c_gray,c_gray,false);

//Buttons
draw_set_color(c_black);
draw_rectangle(hud_left+16,64,hud_right-16,96,false);
draw_rectangle(hud_left+16,112,hud_right-16,144,false);
draw_rectangle(hud_left+16,160,hud_right-16,192,false);
draw_rectangle(hud_left+16,256,hud_right-16,288,false);
draw_rectangle(hud_left+16,304,hud_right-16,336,false);
draw_rectangle(hud_left+16,352,hud_right-16,384,false);
draw_rectangle(hud_left+16,448,hud_right-16,480,false);
draw_rectangle(hud_left+16,496,hud_right-16,528,false);
draw_rectangle(hud_left+16,544,hud_right-16,576,false);
draw_rectangle(hud_left+16,592,hud_right-16,624,false);


//Button highlight
draw_set_color(c_white)
draw_set_alpha(0.20);

if window_mouse_get_x() >= hud_left+16 and window_mouse_get_x() <= hud_right-16
{
	if window_mouse_get_y() >= 64 and window_mouse_get_y() <= 96
	draw_rectangle(hud_left+16,64,hud_right-16,96,false);
	else if window_mouse_get_y() >= 112 and window_mouse_get_y() <= 144
	draw_rectangle(hud_left+16,112,hud_right-16,144,false);
	else if window_mouse_get_y() >= 160 and window_mouse_get_y() <= 192
	draw_rectangle(hud_left+16,160,hud_right-16,192,false);
	else if window_mouse_get_y() >= 256 and window_mouse_get_y() <= 288 and selected > -1
	draw_rectangle(hud_left+16,256,hud_right-16,288,false);
	else if window_mouse_get_y() >= 304 and window_mouse_get_y() <= 336 and selected > 0
	draw_rectangle(hud_left+16,304,hud_right-16,336,false);
	else if window_mouse_get_y() >= 352 and window_mouse_get_y() <= 384 and selected > -1
	draw_rectangle(hud_left+16,352,hud_right-16,384,false);
	else if window_mouse_get_y() >= 448 and window_mouse_get_y() <= 480
	draw_rectangle(hud_left+16,448,hud_right-16,480,false);
	else if window_mouse_get_y() >= 448 and window_mouse_get_y() <= 480
	draw_rectangle(hud_left+16,448,hud_right-16,480,false);
	else if window_mouse_get_y() >= 496 and window_mouse_get_y() <= 528
	draw_rectangle(hud_left+16,496,hud_right-16,528,false);
	else if window_mouse_get_y() >= 544 and window_mouse_get_y() <= 576
	draw_rectangle(hud_left+16,544,hud_right-16,576,false);
	else if window_mouse_get_y() >= 592 and window_mouse_get_y() <= 624
	draw_rectangle(hud_left+16,592,hud_right-16,624,false);
}
draw_set_alpha(1);

if grid_select
draw_rectangle(hud_left+16,448,hud_right-16,480,true);

//Text
draw_text(hud_mid,32,"Files:");
draw_text(hud_mid,80,"Load path");
draw_text(hud_mid,128,"Save path");
draw_text(hud_mid,176,"Background");
draw_text(hud_mid,224,"Point:");
if selected < 0
draw_set_color(c_gray);
else
draw_set_color(c_white);
draw_text(hud_mid,272,"Delete");
if selected < 1
draw_set_color(c_gray);
else
draw_set_color(c_white);
draw_text(hud_mid,320,"Insert");
if selected < 0
{
	draw_set_color(c_gray);
	draw_text(hud_mid,368,"Depth");
}
else
{
	draw_set_color(c_white);
	if path_get_point_speed(path,selected) > 50
	draw_text(hud_mid,368,"Depth: above");
	else
	draw_text(hud_mid,368,"Depth: below");
}
draw_set_color(c_white);
draw_text(hud_mid,416,"Editor:");
if grid_select
draw_text(hud_mid,464,"Grid: "+string(gap_text)+"|");
else
draw_text(hud_mid,464,"Grid: "+string(gap_text));
draw_text(hud_mid,512,"Preview");
draw_text(hud_mid,560,"Reset view");
draw_text(hud_mid,608,"Statistics");
draw_text(hud_mid,656,"");

if debug and !preview
draw_text(96,128,"Points: " + string(path_get_number(path)) +
	"\nLength: " + string(path_get_length(path)) +
	"\nSelected: " + string(selected+1) +
	"\nDragging: " + string(dragging+1) +
	"\n\nPoint X: " + string(path_get_point_x(path,selected)) +
	"\nPoint Y: " + string(path_get_point_y(path,selected))
);