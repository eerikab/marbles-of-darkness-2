/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and image_alpha = 1
{
	if global.gamemode == 1
	{
		instance_destroy(ob_button_load);
		sc_adv_options();
	}
	else
	{
		a = instance_create_depth(x,y,0,ob_transition);
		a.nextroom = rm_freeplay;
	}
}