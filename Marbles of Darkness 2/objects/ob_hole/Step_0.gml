/// @description Insert description here
// You can write your code in this editor

if !active
exit;

if (pathnr == 1 and ds_list_find_value(global.ds_pos1,0) > 1-dist/length)
or (pathnr == 2 and ds_list_find_value(global.ds_pos2,0) > 1-dist/length)
or (pathnr == 3 and ds_list_find_value(global.ds_pos3,0) > 1-dist/length)
or (pathnr == 4 and ds_list_find_value(global.ds_pos4,0) > 1-dist/length)
or (pathnr == 5 and ds_list_find_value(global.ds_pos5,0) > 1-dist/length) 
or (pathnr == 0 and (ds_list_find_value(global.ds_pos1,0) > 1-dist/length
or ds_list_find_value(global.ds_pos2,0) > 1-dist/length 
or ds_list_find_value(global.ds_pos3,0) > 1-dist/length
or ds_list_find_value(global.ds_pos4,0) > 1-dist/length
or ds_list_find_value(global.ds_pos5,0) > 1-dist/length)) 
or global.lost
{
	global.warning = 1;
	warning = 1;
}
else
warning = 0;

if warning = 1
{
	if global.lost
	{
		if alpha1 < 1
		alpha1 += spd
	}
	else
	{
		alpha1 += dir*spd
		if alpha1 = 1 or alpha1 = 0
		dir *= -1
	}
	
	if alpha2 < 1
	alpha2 += spd
}
else
{
	if alpha1 > 0
	alpha1 -= spd
	if alpha2 > 0
	alpha2 -= spd
	if dir != 1
	dir = 1
}

angle += 0.2;