/// @description Poison
// You can write your code in this editor

counter = 4;
i = 1;
forwards = 1;
backwards = 1;

while poison > 0
{
	if forwards
	{
		orb = 0
		if pathnr == 1 and index != 0
		orb = ds_list_find_value(global.ds_id1,index-i);
		if pathnr == 2 and index != 0
		orb = ds_list_find_value(global.ds_id2,index-i);
		if pathnr == 3 and index != 0
		orb = ds_list_find_value(global.ds_id3,index-i);
		if pathnr == 4 and index != 0
		orb = ds_list_find_value(global.ds_id4,index-i);
		if pathnr == 5 and index != 0
		orb = ds_list_find_value(global.ds_id5,index-i);
		
		if orb != 0  and is_numeric(orb) and instance_exists(orb) and orb.object_index == ob_orb
		{
			orb.alarm[4] = counter;
		}
		else
		forwards = 0;
	}
	if backwards
	{
		orb = 0;
		if pathnr == 1 and index != ds_list_size(global.ds_id1)-1
		orb = ds_list_find_value(global.ds_id1,index+i);
		if pathnr == 2 and index != ds_list_size(global.ds_id2)-1
		orb = ds_list_find_value(global.ds_id2,index+i);
		if pathnr == 3 and index != ds_list_size(global.ds_id3)-1
		orb = ds_list_find_value(global.ds_id3,index+i);
		if pathnr == 4 and index != ds_list_size(global.ds_id4)-1
		orb = ds_list_find_value(global.ds_id4,index+i);
		if pathnr == 5 and index != ds_list_size(global.ds_id5)-1
		orb = ds_list_find_value(global.ds_id5,index+i);
		
		if orb != 0 and is_numeric(orb) and instance_exists(orb) and orb.object_index == ob_orb
		{
			orb.alarm[4] = counter;
		}
		else
		backwards = 0;
	}
	poison -= 1;
	counter += 4;
	i += 1;
}
		
alarm[4] = 1;