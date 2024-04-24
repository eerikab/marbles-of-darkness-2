/// @description Insert description here
// You can write your code in this editor

if sprite_exists(background)
draw_sprite(background,0,0,0)

draw_set_color(c_dkgray);
draw_rectangle(0,0,room_width,room_height,true);

if preview = 0
{
	for (i = 0; i<= room_width; i += gap)
	draw_line(i,0,i,room_height);
	for (i = 0; i<= room_height; i += gap)
	draw_line(0,i,room_width,i);

	draw_set_color(c_gray);
	for (i = 1; i < path_get_number(path); i++)
	draw_arrow(path_get_point_x(path,i-1), path_get_point_y(path,i-1),
		path_get_point_x(path,i), path_get_point_y(path,i), 12);

	draw_set_color(c_red);
	//draw_path(path,0,0,1);
	pos = 0;
	while pos < 1
	{
		draw_set_color(make_color_rgb(
			250-path_get_speed(path,pos)*2.5,
			path_get_speed(path,pos)*1.25,
			path_get_speed(path,pos)*2.5));
			
		/*if path_get_speed(path,pos) > 50
		draw_set_color(c_blue);
		else
		draw_set_color(c_red);*/
		
		draw_circle(path_get_x(path,pos),path_get_y(path,pos),1,false);
		pos += 1/path_get_length(path)*zoom;
	}
	
	for (i = 0; i < path_get_number(path); i++)
	{
		if selected = i
		draw_set_color(c_lime);
		else if path_get_point_speed(path,i) < 50
		draw_set_color(c_red);
		else
		draw_set_color(make_color_rgb(0,128,255));
		draw_circle(path_get_point_x(path,i), path_get_point_y(path,i), 4, true);
	}
}
else
{
	draw_set_color(c_white);
	pos = 0;
	while pos < 1
	{
		draw_circle(path_get_x(path,pos),path_get_y(path,pos),16,false);
		pos += 1/path_get_length(path)*zoom;
	}
}