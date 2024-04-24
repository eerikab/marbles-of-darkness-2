/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block)
{
	if audio_is_playing(global.mus_menu)
	{
		a = instance_create_depth(x,y,-100,ob_transition);
		a.nextroom = rm_menu;
	}
	else
	{
		if global.gamemode == 1
		sc_mid_load("Adventure");
		else if global.gamemode == 2
		sc_mid_load("Practice");
		else if global.gamemode == 3
		sc_mid_load("Endless");
		
	}
}