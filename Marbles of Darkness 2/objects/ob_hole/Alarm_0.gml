/// @description Insert description here
// You can write your code in this editor

active = 1;

path = global.path[pathnr]
path_start(path,0,path_action_stop,1);
length = path_get_length(path);
path_position = 1;
pos = 1;
image_angle = point_direction(path_get_x(path,pos),path_get_y(path,pos),path_get_x(path,pos-(4/length)),path_get_y(path,pos-(4/length)));
length = path_get_length(global.path[pathnr])

if global.onehole = 1
{
	if pathnr = 1
	pathnr = 0;
	else
	instance_destroy();
}