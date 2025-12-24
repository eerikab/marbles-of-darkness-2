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
	
	ini_open(global.savefile + "save.ini");
	ini_write_real("Settings","music",global.music);
	ini_write_real("Settings","sound",global.sound);
	ini_write_real("Settings","fullscreen",window_get_fullscreen());
	ini_write_real("Settings","vsync",global.vsync);
	ini_write_real("Settings","alias",gpu_get_texfilter());
	ini_write_real("Settings","skip",global.skip_instruct);
	ini_close();
	
}