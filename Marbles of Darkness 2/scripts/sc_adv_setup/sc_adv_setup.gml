// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_adv_setup(){
	// Load all adventure data from file
	name = global.directory + "config/levels.ini";
	ini_open(name);
	
	length = 1;
	global.length_num = 0;
	global.lvl_adv = [];
	global.lvl_stage = [];
	global.stage_dif = [];
	global.count_levels = [];
	global.count_stages = [];
	global.length_name = [];
	area = "Level config";
	while( ini_section_exists("Length " + string(length)))
	{
		//Load adv data for each length
		area = "Level config, Length " + string(length);
		sect = "Length " + string(length);
		global.length_name[length] = ini_read_string(sect,"name","");
		global.length_num = length;
		global.stages = ini_read_real(sect,"stages",0);
		global.count_stages[length] = global.stages;
		global.count_levels[length] = 0;
		if global.stages == 0
		sc_error("No stages");
		
		stage = 1;
		level = 1;
		while stage <= global.stages
		{
			key = string(stage)+"_"+string(level);
			if ini_key_exists(sect,key)
			{
				map = ini_read_real(sect,key,0);
				if map < 1 or map > global.maps
				sc_error("Invalid map assigned to level " + key);
				
				global.lvl_adv[length][stage][level] = ini_read_real(sect,key,0);
				global.count_levels[length] += 1;
				level += 1;
				key = string(stage)+"_"+string(level);
			}
			else
			{
				if level == 1
				sc_error("No levels in stage " + string(stage));
				global.lvl_stage[length, stage] = level-1;
				difficulty = ini_read_real(sect,"dif"+string(stage), 0);
				if difficulty < 1 or difficulty > global.difficulty_num
				sc_error("Invalid difficulty in stage " + string(stage));
				global.stage_dif[length, stage] = difficulty
				stage += 1;
				level = 1;
			}
		}
		//Bonus map
		key = string(stage)+"_"+string(level);
		global.lvl_adv[length][stage][1] = ini_read_real(sect,key,1);
		
		length += 1;
	}
	if global.length_num == 0
	sc_error("No lengths");
	
	ini_close();
}