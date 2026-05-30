/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and image_alpha = 1
{
	global.gamemode = 1;
	
	instance_destroy(ob_button_practice);
	instance_destroy(ob_button_endless);
	if global.adv_points == 0 and global.check_adv == 0
	{
		sc_adv_options();
	}
	else
	{
		instance_create_depth(x,global.rm_height/2+96,depth,ob_button_load);
		instance_create_depth(x,global.rm_height/2+144,depth,ob_button_newgame);
		instance_destroy();
	}
}