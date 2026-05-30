/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and image_alpha == 1
{
	/*if room = rm_game
	instance_destroy(ob_board_par);*/
	with(ob_board_par)
	{
		spd = -0.02;
		alarm[0] = 1;
	}
	
	sc_settings();
}