/// @description Add to path
// You can write your code in this editor

sprite_index = global.sprite_pusher;
//Start path and initialise
path_start(path,0,path_action_stop,true);
length = path_get_length(path);
spd = (4 + (length/500)) * global.hardness;
max_spd = (4 + (length/500))  * global.hardness;
reverse = 0;
knockback = 0;
shootable = 0;
colour = 0;
combo = 1;

slow = 0;
reverse = 0;
stop = 0;
power_reverse = 0;
shadow = instance_create_depth(x,y,depth,ob_orb_shadow);
shadow.orb = id;
shadow.sprite_index = global.sprite_pusher_shadow;

//Add to list
if pathnr = 1
{
	ds_list_add(global.ds_id1,id);
	ds_list_add(global.ds_pos1,pos);
	ds_list_add(global.ds_col1,0);
}
else if pathnr = 2
{
	ds_list_add(global.ds_id2,id);
	ds_list_add(global.ds_pos2,pos);
	ds_list_add(global.ds_col2,0);
}
else if pathnr = 3
{
	ds_list_add(global.ds_id3,id);
	ds_list_add(global.ds_pos3,pos);
	ds_list_add(global.ds_col3,0);
}
else if pathnr = 4
{
	ds_list_add(global.ds_id4,id);
	ds_list_add(global.ds_pos4,pos);
	ds_list_add(global.ds_col4,0);
}
else if pathnr = 5
{
	ds_list_add(global.ds_id5,id);
	ds_list_add(global.ds_pos5,pos);
	ds_list_add(global.ds_col5,0);
}