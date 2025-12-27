// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_adv_setup(_mode){
	name = global.directory + "config/levels.ini";
	ini_open(name);
	
	if _mode == 0 //Check config
	{	
		i = 1;
		global.length_num = 0;
		while( ini_section_exists("Length " + string(i)))
		{
			//Load adv data for each length
			area = "Level config, Length " + string(i);
			sect = "Length " + string(i);
			global.length_name[i] = ini_read_string(sect,"name","");
			global.length_num = i;
			global.stages = ini_read_real(sect,"stages",0);
			global.count_stages[i] = global.stages;
			global.count_levels[i] = 0;
			if global.stages = 0
			sc_error("No stages");
		
			stage = 1;
			level = 1;
			while stage <= global.stages
			{
				key = string(stage)+"_"+string(level);
				if ini_key_exists(sect,key)
				{
					global.lvl_adv[stage,level] = ini_read_real(sect,key,0);
					global.count_levels[i] += 1;
					level += 1;
					key = string(stage)+"_"+string(level);
				}
				else
				{
					if level == 1
					sc_error("No levels in stage " + string(stage));
					stage += 1;
					level = 1;
				}
			}
			i += 1;
		
		}
	}
	
	if _mode == 1 //Load selected adv length
	{
		sect = "Length " + string(global.adv_length);
		global.stages = ini_read_real(sect,"stages",0);
		
		global.lvl_adv = [];
		global.lvl_stage = [];
		global.stage_dif = [];
	
		stage = 1;
		level = 1;
		while stage <= global.stages
		{
			key = string(stage)+"_"+string(level);
			if ini_key_exists(sect,key)
			{
				global.lvl_adv[stage,level] = ini_read_real(sect,key,0);
				level += 1;
			}
			else
			{
				global.lvl_stage[stage] = level-1;
				global.stage_dif[stage] = ini_read_real(sect,"dif"+string(stage), 0);
				stage += 1;
				level = 1;
			}
		}
		key = string(stage)+"_"+string(level);
		global.lvl_adv[stage,1] = ini_read_real(sect,key,1);
	}
	
	ini_close();
}