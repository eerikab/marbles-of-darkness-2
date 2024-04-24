/// @description Insert description here
// You can write your code in this editor

image_angle = point_direction(path_get_x(path,pos),path_get_y(path,pos),path_get_x(path,pos+(1/length)),path_get_y(path,pos+(1/length)));
image_index = round(pos*length*0.3) mod image_number;

if pathnr = 1
index = ds_list_find_index(global.ds_id1,id);
if pathnr = 2
index = ds_list_find_index(global.ds_id2,id);
if pathnr = 3
index = ds_list_find_index(global.ds_id3,id);
if pathnr = 4
index = ds_list_find_index(global.ds_id4,id);
if pathnr = 5
index = ds_list_find_index(global.ds_id5,id);

//If wrong colour on list, fix it
if colour < 1
colour = 1;

if pathnr == 1 and ds_list_find_value(global.ds_col1,index) != colour 
ds_list_replace(global.ds_col1,index,colour);
if pathnr == 2 and ds_list_find_value(global.ds_col2,index) != colour 
ds_list_replace(global.ds_col2,index,colour);
if pathnr == 3 and ds_list_find_value(global.ds_col3,index) != colour 
ds_list_replace(global.ds_col3,index,colour);
if pathnr == 4 and ds_list_find_value(global.ds_col4,index) != colour 
ds_list_replace(global.ds_col4,index,colour);
if pathnr == 5 and ds_list_find_value(global.ds_col5,index) != colour 
ds_list_replace(global.ds_col5,index,colour);

sprite_index = global.sprite_orb[colour];

//Depth
depth = round((0 - path_get_speed(path,pos))+50)

if position_meeting(x,y,ob_tunnel) and depth > 0
shootable = 0;
else
shootable = 1;

if !visible and !hidden
visible = 1;

//Level fail
if path_position = 1
{
	instance_destroy()
	if global.game = 1
	{
		global.game = 0;
		global.lost = 1;
		instance_create_depth(0,0,-50,ob_fail);
		audio_stop_all();
		audio_play_sound(global.sou_rolling,0,0);
	}
}