/// @description Insert description here
// You can write your code in this editor

//Movement
pos -= 32/length;
path_position = pos;
depth = (0 - path_get_speed(path,pos))+50

//If touching an orb, remove both
if pathnr == 1 and ds_list_find_value(global.ds_pos1,0) > pos - 32/length 
{
	global.level_progress += 1;
	score += 100;
	instance_destroy( ds_list_find_value(global.ds_id1,0));
	instance_destroy()
}
if pathnr == 2 and ds_list_find_value(global.ds_pos2,0) > pos - 32/length 
{
	global.level_progress += 1;
	score += 100;
	instance_destroy( ds_list_find_value(global.ds_id2,0));
	instance_destroy()
}
if pathnr == 3 and ds_list_find_value(global.ds_pos3,0) > pos - 32/length 
{
	global.level_progress += 1;
	score += 100;
	instance_destroy( ds_list_find_value(global.ds_id3,0));
	instance_destroy()
}
if pathnr == 4 and ds_list_find_value(global.ds_pos4,0) > pos - 32/length 
{
	global.level_progress += 1;
	score += 100;
	instance_destroy( ds_list_find_value(global.ds_id4,0));
	instance_destroy()
}
if pathnr == 5 and ds_list_find_value(global.ds_pos5,0) > pos - 32/length 
{
	global.level_progress += 1;
	score += 100;
	instance_destroy( ds_list_find_value(global.ds_id5,0));
	instance_destroy()
}