/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block)
{
	a = instance_create_depth(x,y,0,ob_transition);
	if global.gamemode == 1
	{
		if lives < 1
		a.nextroom = rm_menu;
		else
		{
			a.nextroom = rm_map;
		}
	}
	else
	a.nextroom = rm_freeplay;
}