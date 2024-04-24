/// @description Remove from lists
// You can write your code in this editor

if pathnr = 1
{
	index = ds_list_find_index(global.ds_id1,id);
	ds_list_delete(global.ds_id1,index);
	ds_list_delete(global.ds_pos1,index);
	ds_list_delete(global.ds_col1,index);
}
else if pathnr = 2
{
	index = ds_list_find_index(global.ds_id2,id);
	ds_list_delete(global.ds_id2,index);
	ds_list_delete(global.ds_pos2,index);
	ds_list_delete(global.ds_col2,index);
}
else if pathnr = 3
{
	index = ds_list_find_index(global.ds_id3,id);
	ds_list_delete(global.ds_id3,index);
	ds_list_delete(global.ds_pos3,index);
	ds_list_delete(global.ds_col3,index);
}
else if pathnr = 4
{
	index = ds_list_find_index(global.ds_id4,id);
	ds_list_delete(global.ds_id4,index);
	ds_list_delete(global.ds_pos4,index);
	ds_list_delete(global.ds_col4,index);
}
else if pathnr = 5
{
	index = ds_list_find_index(global.ds_id5,id);
	ds_list_delete(global.ds_id5,index);
	ds_list_delete(global.ds_pos5,index);
	ds_list_delete(global.ds_col5,index);
}

global.end_bonus[pathnr] = pos;

if global.game
{
	effect_create_below( ef_spark,x,y,1, c_white);
	audio_play_sound(global.sou_pusher_break,0,0);
}