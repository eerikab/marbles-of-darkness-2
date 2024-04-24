/// @description Reset orb shoot
// You can write your code in this editor

if new_ball = false and create_orb
instance_create_depth(x,room_height-80,depth,ob_orbshot);

//Remove from orb list
if matching
{
	if ds_list_find_index(global.ds_id1,id) != -1
	{
		index = ds_list_find_index(global.ds_id1,id);
		ds_list_delete(global.ds_id1,index);
		ds_list_delete(global.ds_pos1,index);
		ds_list_delete(global.ds_col1,index);
	}
	else if ds_list_find_index(global.ds_id2,id) != -1
	{
		index = ds_list_find_index(global.ds_id2,id);
		ds_list_delete(global.ds_id2,index);
		ds_list_delete(global.ds_pos2,index);
		ds_list_delete(global.ds_col2,index);
	}
	else if ds_list_find_index(global.ds_id3,id) != -1
	{
		index = ds_list_find_index(global.ds_id3,id);
		ds_list_delete(global.ds_id3,index);
		ds_list_delete(global.ds_pos3,index);
		ds_list_delete(global.ds_col3,index);
	}
	else if ds_list_find_index(global.ds_id4,id) != -1
	{
		index = ds_list_find_index(global.ds_id4,id);
		ds_list_delete(global.ds_id4,index);
		ds_list_delete(global.ds_pos4,index);
		ds_list_delete(global.ds_col4,index);
	}
	else if ds_list_find_index(global.ds_id5,id) != -1
	{
		index = ds_list_find_index(global.ds_id5,id);
		ds_list_delete(global.ds_id5,index);
		ds_list_delete(global.ds_pos5,index);
		ds_list_delete(global.ds_col5,index);
	}
}