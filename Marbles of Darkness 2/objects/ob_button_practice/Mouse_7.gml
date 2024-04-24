/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and image_alpha = 1
{
	global.gamemode = 2;
	if global.check_prac
	{
		instance_destroy(ob_button_adventure);
		instance_destroy(ob_button_endless);
		instance_destroy();
		
		instance_create_depth(x,global.rm_height/2+96,depth,ob_button_load);
		instance_create_depth(x,global.rm_height/2+144,depth,ob_button_newgame);
	}
	else
	{
		a = instance_create_depth(x,y,0,ob_transition);
		a.nextroom = rm_freeplay;
	}
}