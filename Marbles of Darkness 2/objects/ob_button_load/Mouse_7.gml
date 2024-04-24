/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and image_alpha = 1
{
	if global.gamemode==1
	{
		if global.check_adv == 1
		sc_mid_load("Adventure");
		else
		{
			a = instance_create_depth(x,y,0,ob_transition);
			a.nextroom = rm_map;
		}
	}
	else if global.gamemode==2
	{
		sc_mid_load("Practice");
	}
	else if global.gamemode==3
	{
		sc_mid_load("Endless");
	}
}