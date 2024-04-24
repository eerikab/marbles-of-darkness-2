/// @description Insert description here
// You can write your code in this editor

if mode = 1
{
	x = mouse_x;
	x = clamp(x,16,room_width-16);
}
else
{
	image_angle = point_direction(x,y,mouse_x,mouse_y);
}


if global.game = 1
{
	//if image_index = 16
	//image_index = irandom_range(1,global.orb_sprites);
	//Check if there's an orb with the same colour
	if ((ds_list_find_index(global.ds_col1,image_index) = -1
	and ds_list_find_index(global.ds_col2,image_index) = -1
	and ds_list_find_index(global.ds_col3,image_index) = -1
	and ds_list_find_index(global.ds_col4,image_index) = -1
	and ds_list_find_index(global.ds_col5,image_index) = -1) or image_index = 0 or image_index = 16) 
	and (image_index < 11 or image_index > 19 or image_index = 16) 
	and instance_exists(ob_orb) and instance_exists(ob_orbshot)
	{
		//Switch colour until valid
		image_index = irandom_range(1,global.orb_sprites);
		while (ds_list_find_index(global.ds_col1,image_index) = -1
		and ds_list_find_index(global.ds_col2,image_index) = -1
		and ds_list_find_index(global.ds_col3,image_index) = -1
		and ds_list_find_index(global.ds_col4,image_index) = -1
		and ds_list_find_index(global.ds_col5,image_index) = -1)
		or (image_index > 10 and image_index < 20)
		image_index = irandom_range(1,global.dif_col[global.difficulty]);
	}
	
	if !instance_exists(ob_orb)
	image_index = 0;
}
else if image_index != 0
image_index = 0;