/// @description Insert description here
// You can write your code in this editor

image_angle = point_direction(x,y,path_get_x(path,pos+(1/length)),path_get_y(path,pos+(1/length)));

//If no more orbs are left
if pathnr = 1
{
	index = ds_list_find_index(global.ds_id1,id);
}
else if pathnr = 2
{
	index = ds_list_find_index(global.ds_id2,id);
}
else if pathnr = 3
{
	index = ds_list_find_index(global.ds_id3,id);
}
else if pathnr = 4
{
	index = ds_list_find_index(global.ds_id4,id);
}
else if pathnr = 5
{
	index = ds_list_find_index(global.ds_id5,id);
}
if index = 0
{
	if global.game == 1
	{
		sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
	}
	instance_destroy();
}

depth = round((0 - path_get_speed(path,pos))+50);

if position_meeting(x,y,ob_tunnel) and depth > 0
shootable = 0;
else
shootable = 1;