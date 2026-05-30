// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_level_config(){
	//Load level and map configuration
	name = global.directory + "config/maps.ini";
	ini_open(name);
	i = 1;
	
	global.title = [];
	global.background = [];
	global.tunnel = [];
	global.level_onehole = [];
	global.level_pad = [];
	global.level_path = [];
	global.level_paths = [];
	global.max_paths = 0;
	
	//Load map data
	for (i = 1; ini_section_exists("Map " + string(i)); i++)
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
		
		if global.title[i] == ""
		sc_error(sect + " title not set");
		if global.background[i] == ""
		sc_error(sect + " background not set");
		
		global.level_pad[i] = [];
		if ini_key_exists(sect,"padx") and ini_key_exists(sect,"pady")
		{
			global.level_pad[i,0] = ini_read_real(sect,"padx",0);
			global.level_pad[i,1] = ini_read_real(sect,"pady",0);
			j = 2;
			key = "pad"+string(j);
			while ini_key_exists(sect,key+"x") and ini_key_exists(sect,key+"y")
			{
				array_push(global.level_pad[i], 
					ini_read_real(sect,key+"x",0), 
					ini_read_real(sect,key+"y",0));
				j += 1;
				key = "pad"+string(j);
			}
		}
		
		//Paths - load as many as there are
		for (pathnr = 1; pathnr > 0; pathnr++)
		{
			key = "path"+string(pathnr);
			if ini_key_exists(sect, key)
			{
				global.level_path[i,pathnr] = sc_path_import(ini_read_string(sect,key,""));
				global.level_paths[i] = pathnr;

				if pathnr > global.max_paths
				global.max_paths = pathnr;
			}
			else
			{
				if pathnr == 1
				sc_error(sect + " path not set");
				break;
			}
		}
	}
	global.maps = i-1;
	ini_close();
	
	if global.maps == 0
	sc_error("No valid maps found");
	
	//Level configuration
	name = global.directory + "config/levels.ini";
	ini_open(name);
	
	global.max_colors = 0;
	global.dif_orbs = [];
	global.dif_len = [];
	global.dif_target = [];
	global.dif_col = [];
	global.dif_point = [];
	global.dif_cooldown = [];
	for(i = 1; ini_section_exists("Step " + string(i)); i++)
	{
		
		//Load level difficulties
		sect = "Step " + string(i);
		area = "Level config, " + sect;
		global.dif_orbs[i] = ini_read_real(sect,"orbs",0);
		global.dif_len[i] = ini_read_real(sect,"boost",0);
		global.dif_target[i] = ini_read_real(sect,"target",0);
		colors = ini_read_real(sect,"colors",0);
		global.dif_col[i] = colors;
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
		
		if colors > global.max_colors
		global.max_colors = colors;
	}
	global.difficulty_num = i-1;
	if global.difficulty_num == 0
	sc_error("No valid difficulties found");
	
	sect = "Path multiplier";
	area = "Path multiplier";
	for (i = 1; i <= global.max_paths; i++)
	{
		global.dif_path[i] = ini_read_real(sect,string(i)+"path",1);
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
	if global.difs > global.difficulty_num
	sc_error("Practice uses more difficulties than are available");
	if global.difs <= 0
	sc_error("No difficulties set");
	global.dif_free = ini_read_real(sect,"multiplier",1);
	global.increment = ini_read_real(sect,"increment",0);
	
	ini_close();
}