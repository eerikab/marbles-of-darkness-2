/// @description Add on path
// You can write your code in this editor

//Start path and initialise
sprite_index = global.sprite_orb[1];
path_start(path,0,path_action_stop,true);
length = path_get_length(path);
image_speed = 0;
matched = false;
reverse = 0;
knockback = 0;
shootable = 1;
depth = 50;
hidden = 1;
alarm[1] = 3;
combo = 1;
shadow = instance_create_depth(x,y,depth,ob_orb_shadow);
shadow.orb = id;
poison = 0;
poison_dir = 0;

//If it's a new orb
if index = -1
{
	//Set colour
	colour = irandom_range(1,global.dif_col[global.difficulty]);
	while colour > 10 and colour < 20
	colour = irandom_range(1,global.dif_col[global.difficulty]);

	//Add to list
	if pathnr = 1
	{
		if ds_list_size(global.ds_col1) > 1 and irandom(2) = 0
		colour = ds_list_find_value(global.ds_col1, ds_list_size(global.ds_col1)-1);
		
		if colour < 1
		colour = 1;
		
		ds_list_add(global.ds_id1,id);
		ds_list_add(global.ds_pos1,pos);
		ds_list_add(global.ds_col1,colour);
	}
	else if pathnr = 2
	{
		if ds_list_size(global.ds_col2) > 1 and irandom(2) = 0
		colour = ds_list_find_value(global.ds_col2, ds_list_size(global.ds_col2)-1);
		
		if colour < 1
		colour = 1;
		
		ds_list_add(global.ds_id2,id);
		ds_list_add(global.ds_pos2,pos);
		ds_list_add(global.ds_col2,colour);
	}
	else if pathnr = 3
	{
		if ds_list_size(global.ds_col3) > 1 and irandom(2) = 0
		colour = ds_list_find_value(global.ds_col3, ds_list_size(global.ds_col3)-1);
		
		if colour < 1
		colour = 1;
		
		ds_list_add(global.ds_id3,id);
		ds_list_add(global.ds_pos3,pos);
		ds_list_add(global.ds_col3,colour);
	}
	else if pathnr = 4
	{
		if ds_list_size(global.ds_col4) > 1 and irandom(2) = 0
		colour = ds_list_find_value(global.ds_col4, ds_list_size(global.ds_col4)-1);
		
		if colour < 1
		colour = 1;
		
		ds_list_add(global.ds_id4,id);
		ds_list_add(global.ds_pos4,pos);
		ds_list_add(global.ds_col4,colour);
	}
	else if pathnr = 5
	{
		if ds_list_size(global.ds_col5) > 1 and irandom(2) = 0
		colour = ds_list_find_value(global.ds_col5, ds_list_size(global.ds_col5)-1);
		
		if colour < 1
		colour = 1;
		
		ds_list_add(global.ds_id5,id);
		ds_list_add(global.ds_pos5,pos);
		ds_list_add(global.ds_col5,colour);
	}
}
else
//If added by an orb
{
	if colour < 1
	colour = 1;
	
	//Add to list
	if pathnr = 1
	{
		ds_list_insert(global.ds_id1,index,id);
		ds_list_insert(global.ds_pos1,index,pos);
		ds_list_insert(global.ds_col1,index,colour);
	}
	else if pathnr = 2
	{
		ds_list_insert(global.ds_id2,index,id);
		ds_list_insert(global.ds_pos2,index,pos);
		ds_list_insert(global.ds_col2,index,colour);
	}
	else if pathnr = 3
	{
		ds_list_insert(global.ds_id3,index,id);
		ds_list_insert(global.ds_pos3,index,pos);
		ds_list_insert(global.ds_col3,index,colour);
	}
	else if pathnr = 4
	{
		ds_list_insert(global.ds_id4,index,id);
		ds_list_insert(global.ds_pos4,index,pos);
		ds_list_insert(global.ds_col4,index,colour);
	}
	else if pathnr = 5
	{
		ds_list_insert(global.ds_id5,index,id);
		ds_list_insert(global.ds_pos5,index,pos);
		ds_list_insert(global.ds_col5,index,colour);
	}
	match_knockback = 0;
	alarm[2] = 3;
}
