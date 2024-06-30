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
	//if colour = 16
	//colour = irandom_range(1,global.orb_sprites);
	//Check if there's an orb with the same colour
	if ((ds_list_find_index(global.ds_col1,colour) = -1
	and ds_list_find_index(global.ds_col2,colour) = -1
	and ds_list_find_index(global.ds_col3,colour) = -1
	and ds_list_find_index(global.ds_col4,colour) = -1
	and ds_list_find_index(global.ds_col5,colour) = -1) or colour = 0 or colour = 16) 
	and (colour < 11 or colour > 19 or colour = 16) 
	and instance_exists(ob_orb) and instance_exists(ob_orbshot)
	{
		//Switch colour until valid
		colour = irandom_range(1,global.orb_sprites);
		while (ds_list_find_index(global.ds_col1,colour) = -1
		and ds_list_find_index(global.ds_col2,colour) = -1
		and ds_list_find_index(global.ds_col3,colour) = -1
		and ds_list_find_index(global.ds_col4,colour) = -1
		and ds_list_find_index(global.ds_col5,colour) = -1)
		or (colour > 10 and colour < 20)
		colour = irandom_range(1,global.dif_col[global.difficulty]);
	}
	
	if !instance_exists(ob_orb)
	colour = 0;
}
else if colour != 0
colour = 0;

if global.bullets > 0
image_index = 16;
else
image_index = colour;