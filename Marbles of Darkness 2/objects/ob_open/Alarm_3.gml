/// @description Load paths
// You can write your code in this editor

//Load config
sc_config();
sc_adv_setup(0);
global.path_map = sc_path_import("pt_map");
global.unlocked = [];
global.endless_high = [];

for (i = 1; i <= global.maps; i += 1)
{
	ini_open(global.savefile + "save.ini");
	global.unlocked[i] = ini_read_real("Unlocked",string(i),0);
	global.endless_high[i] = ini_read_real("Endless","highscore"+ string(i),0);
	ini_close();
}

sc_load_advance();