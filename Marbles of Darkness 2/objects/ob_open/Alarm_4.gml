/// @description Load backgrounds
// You can write your code in this editor

//Menu backgrounds
area = "Image config. Backgrounds";
directory = "backgrounds";
name = global.directory + "config/images.ini";
sect = "Backgrounds";
ini_open(name);

global.back_map = sc_load_sprite( ini_read_string(sect,"map",""), 
	1,0,0,0, "Map background");
global.back_play = sc_load_sprite( ini_read_string(sect,"freeplay",""), 
	1,0,0,0, "Freeplay background");
global.back_instruct = sc_load_sprite( ini_read_string(sect,"instructions",""), 
	1,0,0,0, "Instructions background");
global.back_stat = sc_load_sprite( ini_read_string(sect,"stats",""), 
	1,0,0,0, "Stats background");
global.back_end = sc_load_sprite( ini_read_string(sect,"ending",""), 
	1,0,0,0, "Ending background");
global.back_credits = sc_load_sprite( ini_read_string(sect,"credits",""), 
	1,0,0,0, "Credits background");

//Level backgrounds
for (i = 1; i <= global.maps; i++)
{
	name = global.background[i];
	global.background[i] = sc_load_sprite(global.background[i],1,0,0,0,
		"Map " + string(i) + " background " + name);
}

sc_load_advance();