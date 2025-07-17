/// @description Insert description here
// You can write your code in this editor

image_angle = point_direction(x,y,path_get_x(path,pos+(1/length)),path_get_y(path,pos+(1/length)));

//If no more orbs are left
index = array_get_index(global.ls_orbs,id);
if index == 0
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