// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_config(){
	name = global.directory + "config/maps.ini";
	ini_open(name);
	i = 1;
	
	//Load map data
	while ini_section_exists("Map " + string(i))
	{
		sect = "Map " + string(i)
		//General
		global.title[i] = ini_read_string(sect,"title","");
		global.background[i] = ini_read_string(sect,"background","");
		if ini_key_exists(sect,"tunnel")
		global.tunnel[i] = ini_read_string(sect,"tunnel","");
		else
		global.tunnel[i] = 0;
		global.level_onehole[i] = ini_read_real(sect,"onehole",0);
		if ini_key_exists(sect,"padx") and ini_key_exists(sect,"pady")
		{
			global.level_pad[i,0] = ini_read_real(sect,"padx",0);
			global.level_pad[i,1] = ini_read_real(sect,"pady",0);
			if ini_key_exists(sect,"pad2x") and ini_key_exists(sect,"pad2y")
			{
				global.level_pad[i,2] = ini_read_real(sect,"pad2x",0);
				global.level_pad[i,3] = ini_read_real(sect,"pad2y",0);
			}
			else
			{
				global.level_pad[i,2] = "";
				global.level_pad[i,3] = "";
			}
		}
		else
		{
			global.level_pad[i,0] = "";
			global.level_pad[i,1] = "";
			global.level_pad[i,2] = "";
			global.level_pad[i,3] = "";
		}
		
		//Paths
		global.level_path[i,1] = sc_path_import(ini_read_string(sect,"path1",""));
		global.level_paths[i] = 1;
		if ini_key_exists(sect,"path2")
		{
			global.level_path[i,2] = sc_path_import(ini_read_string(sect,"path2",""));
			global.level_paths[i] = 2;
			if ini_key_exists(sect,"path3")
			{
				global.level_path[i,3] = sc_path_import(ini_read_string(sect,"path3",""));
				global.level_paths[i] = 3;
				if ini_key_exists(sect,"path4")
				{
					global.level_path[i,4] = sc_path_import(ini_read_string(sect,"path4",""));
					global.level_paths[i] = 4;
					if ini_key_exists(sect,"path5")
					{
						global.level_path[i,5] = sc_path_import(ini_read_string(sect,"path5",""));
						global.level_paths[i] = 5;
					}
				}
			}
		}
		
		i += 1;
	}
	global.maps = i-1;
	ini_close();
	
	//Level configuration
	name = global.directory + "config/levels.ini";
	ini_open(name);
	
	i = 1;
	while( ini_section_exists("Step " + string(i)))
	{
		//Load level difficulties
		area = "Level config, Step " + string(i);
		sect = "Step " + string(i);
		global.dif_orbs[i] = ini_read_real(sect,"orbs",0);
		global.dif_len[i] = ini_read_real(sect,"boost",0);
		global.dif_target[i] = ini_read_real(sect,"target",0);
		global.dif_col[i] = ini_read_real(sect,"colors",0);
		global.dif_point[i] = ini_read_real(sect,"bonus",0);
		global.dif_cooldown[i] = ini_read_real(sect,"cooldown",0);
		
		if global.dif_orbs[i] <= 0
		sc_error("'orbs' not set or invalid");
		if global.dif_len[i] <= 0
		sc_error("'boost' not set or invalid");
		if global.dif_target[i] <= 0
		sc_error("'target' not set or invalid");
		if global.dif_col[i] <= 0
		sc_error("'colors' not set or invalid");
		if global.dif_point[i] <= 0
		sc_error("'point' not set or invalid");
		if global.dif_cooldown[i] <= 0
		sc_error("'cooldown' not set or invalid");
		
		i += 1;
	}
	global.difficulty_num = i-1;
	
	sect = "Path multiplier";
	area = "Path multiplier";
	for (i = 1; i<=5; i++)
	{
		global.dif_path[i] = ini_read_real(sect,string(i)+"path",0);
		if global.dif_path[i] <= 0
		sc_error("Path multiplier " + string(i) + " invalid");
	}
	
	i = 1;
	global.dif_mode_num = 0;
	while( ini_section_exists("Difficulty " + string(i)))
	{
		//Adv difficulties
		area = "Level config, difficulty " + string(i);
		sect = "Difficulty " + string(i);
		global.dif_mode[i] = ini_read_real(sect,"multiplier",0);
		global.dif_mode_name[i] = ini_read_string(sect,"name","");
		if global.dif_mode[i] <= 0
		sc_error("Multiplier not set or invalid");
		global.dif_mode_num = i;
		
		i += 1;
	}
	area = "Level config";
	if global.dif_mode_num == 0
	sc_error("No difficulties found");
	
	global.dif_default = ini_read_real("Default","difficulty",1);
	global.len_default = ini_read_real("Default","length",1);
	
	area = "Level config, Free play"
	sect = "Free play"
	global.difs = ini_read_real(sect,"difficulties",0);
	if global.difs <= 0
	sc_error("No difficulties set");
	global.dif_free = ini_read_real(sect,"multiplier",1);
	global.increment = ini_read_real(sect,"increment",0);
	
	ini_close();
}