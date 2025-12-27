// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_load(){
	///Load game progress
	ini_open(global.savefile + "save.ini");
	global.first_start = ini_section_exists("Adventure");
	global.adv_stage = ini_read_real("Adventure","stage",1);
	global.adv_level = ini_read_real("Adventure","level",1);
	global.adv_points = ini_read_real("Adventure","score",0);
	global.adv_lives = ini_read_real("Adventure","lives",3);
	global.adv_live_score = ini_read_real("Adventure","live_score",0);
	global.dif_user = ini_read_real("Adventure","difficulty",1);
	global.adv_length = ini_read_real("Adventure","length",1);
	global.check_adv = ini_read_real("In progress","adventure",0);
	global.check_prac = ini_read_real("In progress","practice",0);
	global.check_end = ini_read_real("In progress","endless",0);
	if global.dif_user < 1
	global.dif_user = 1;
	if global.adv_length < 1
	global.adv_length = 1;
	if global.adv_lives <= 0
	sc_highscore(global.adv_points);
	ini_close();
	sc_adv_setup(1);
	
	//Force reset if invalid save is detected
	global.adv_valid = true;
	if global.adv_stage > global.stages or global.adv_level > global.lvl_stage[global.adv_stage]
	{
		global.adv_points = 0;
		global.check_adv = 0;
		global.adv_valid = false;
	}
}

function sc_save(){
	///Save game progress
	ini_open(global.savefile + "save.ini");
	
	mode = "Adventure";
	ini_write_real("Adventure","stage",global.adv_stage);
	ini_write_real("Adventure","level",global.adv_level); 
	ini_write_real("Adventure","score",global.adv_points); 
	ini_write_real("Adventure","lives",global.adv_lives); 
	ini_write_real("Adventure","live_score",global.adv_live_score);
	ini_write_real("Adventure","difficulty",global.dif_user);
	ini_write_real("Adventure","length",global.adv_length);
	ini_write_real("In progress","adventure",0);
	
	
	ini_write_string(mode,"mid_level","LVL "+string(global.adv_stage)+"-"+string(global.adv_level));
	ini_write_string(mode,"mid_name",global.title[global.lvl_adv[global.adv_stage,global.adv_level]]);
	ini_write_real(mode,"mid_score",score);
	ini_write_string(mode,"mid_difficulty_text",global.dif_mode_name[global.dif_user] + " difficulty");
	ini_write_string(mode,"mid_length",global.length_name[global.adv_length] + " length");

	ini_close();
}

function sc_mid_save(mode){
	///Mid-level save
	instance_activate_all();
	ini_open(global.savefile + "save.ini");
	
	//Save info
	if global.gamemode == 1
	ini_write_string(mode,"mid_level","LVL "+string(global.adv_stage)+"-"+string(global.adv_level));
	else if global.gamemode == 2
	ini_write_string(mode,"mid_level","Level "+string(global.difficulty));
	else if global.gamemode == 3
	ini_write_string(mode,"mid_level","Level "+string(global.endless_dif));
	
	ini_write_string(mode,"mid_name",global.title[global.selected]);
	ini_write_real(mode,"mid_score",score);
	
	//Save data
	ini_write_real(mode,"mid_bullets",global.bullets);
	ini_write_real(mode,"mid_chain",global.chain);
	ini_write_real(mode,"mid_chain_high",global.chain_high);
	ini_write_real(mode,"mid_combo_high",global.combo_high);
	ini_write_real(mode,"mid_dif_user",global.dif_user);
	ini_write_real(mode,"mid_difficulty",global.difficulty);
	ini_write_real(mode,"mid_endless_dif",global.endless_dif);
	ini_write_real(mode,"mid_hardness",global.hardness);
	ini_write_real(mode,"mid_level_progress",global.level_progress);
	ini_write_real(mode,"mid_level_time",global.level_time);
	ini_write_real(mode,"mid_lives",lives);
	ini_write_real(mode,"mid_live_score",global.adv_live_score);
	ini_write_real(mode,"mid_lvl_music",global.lvl_music);
	ini_write_real(mode,"mid_match_colour",global.match_colour);
	ini_write_real(mode,"mid_match_pos",global.match_pos);
	ini_write_real(mode,"mid_matches",global.matches);
	ini_write_real(mode,"mid_onehole",global.onehole);
	ini_write_real(mode,"mid_orbs_shot",global.orbs_shot);
	ini_write_real(mode,"mid_path_multi",global.path_multi);
	ini_write_real(mode,"mid_powerups",global.powerups);
	ini_write_real(mode,"mid_accuracy",global.accuracy);
	ini_write_real(mode,"mid_precise",global.precise);
	ini_write_real(mode,"mid_retract",global.retract);
	ini_write_real(mode,"mid_selected",global.selected);
	ini_write_real(mode,"mid_segments",global.segments);
	ini_write_real(mode,"mid_shots_missed",global.shots_missed);
	ini_write_real(mode,"mid_specialorb",global.specialorb);
	ini_write_real(mode,"mid_start_score",global.start_score);
	ini_write_real(mode,"mid_warning",global.warning);
	ini_write_real(mode,"mid_music",global.music_nr);
	
	if global.gamemode == 1
	{
		ini_write_string(mode,"mid_difficulty_text",global.dif_mode_name[global.dif_user] + " difficulty");
		ini_write_string(mode,"mid_length",global.length_name[global.adv_length] + " length");
	}
	
	with(ob_pusher)
	ini_write_real(mode,id,spd);
	ini_write_real(mode,"mid_shooter",ob_shooter.colour);
	with(ob_spawner)
	ini_write_real(mode,"mid_cooldown_" + string(pathnr),cooldown);
	
	if global.gamemode == 1
	ini_write_real("In progress","adventure",1);
	else if global.gamemode == 2
	ini_write_real("In progress","practice",1);
	else if global.gamemode == 3
	ini_write_real("In progress","endless",1);
	
	ini_close();
	
	
	var _txt = file_text_open_write(global.savefile + mode + ".txt");
	if _txt == -1
	show_debug_message("File open failed");
	
	//Shot orbs
	_savedata = array_create(0);
	with(ob_orbshot)
	{
		if matching
		{
			array_delete(global.ls_orbs[pathnr],index,1);
					
			if instance_exists(orb)
			{
				instance_create_layer(x,y,"Instances",ob_orb,
				{
					path : orb.path,
					pathnr : orb.pathnr,
					pos : orb.pos - (33 / orb.length),
					index : index,
					colour : colour
				});
			}
			global.matching[pathnr] = 1;
			instance_destroy();
		}
		else
		{
			var _saveobj =
			{
				obj : object_get_name(object_index),
				y : y,
				x : x,
				image_index : image_index,
				colour : colour,
				shot : shot,
				image_angle : image_angle,
				new_ball : new_ball,
				matching : matching,
				knockback : knockback,
				reverse : reverse,
				pos : pos,
				orb : orb,
				create_orb : create_orb
			}
			array_push(_savedata,_saveobj);
		}
	}
	_string = json_stringify(_savedata);
	file_text_write_string(_txt,_string);
	file_text_writeln(_txt);
	
	//Save paths
	paths = [];
	for (pathnr = 0; pathnr < global.paths; pathnr++)
	{
		paths[pathnr] = [];
		for (index = 0; index < array_length(global.ls_orbs[pathnr+1]); index++)
		{
			orb = global.ls_orbs[pathnr+1, index];
			paths[pathnr, index] = [orb.pos, orb.colour];
		}
	}
	var json = json_stringify(paths);
	file_text_write_string(_txt,json);
	file_text_writeln(_txt);
	
	//Powerups
	var _savedata = array_create(0);
	with(ob_powerup)
	{
		var _saveobj =
		{
			obj : object_get_name(object_index),
			y : y,
			x : x,
			image_index : image_index,
			image_blend : image_blend,
			depth : depth,
			cooldown : cooldown,
			move : move
		}
		array_push(_savedata,_saveobj);
	}
	var _string = json_stringify(_savedata);
	file_text_write_string(_txt,_string);
	file_text_writeln(_txt);
	
	//Antiorbs
	_savedata = array_create(0);
	with(ob_antiorb)
	{
		var _saveobj =
		{
			obj : object_get_name(object_index),
			pathnr : pathnr,
			pos : pos
		}
		array_push(_savedata,_saveobj);
	}
	_string = json_stringify(_savedata);
	file_text_write_string(_txt,_string);
	file_text_writeln(_txt);
	
	//Blockers
	_savedata = array_create(0);
	with(ob_blocker)
	{
		var _saveobj =
		{
			obj : object_get_name(object_index),
			pathnr : pathnr,
			life : life
		}
		array_push(_savedata,_saveobj);
	}
	_string = json_stringify(_savedata);
	file_text_write_string(_txt,_string);
	file_text_writeln(_txt);
	
	//Inferno
	_savedata = array_create(0);
	with(ob_inferno)
	{
		var _saveobj =
		{
			obj : object_get_name(object_index),
			amount : amount
		}
		array_push(_savedata,_saveobj);
	}
	_string = json_stringify(_savedata);
	file_text_write_string(_txt,_string);
	file_text_writeln(_txt);
	
	file_text_close(_txt);
}

function sc_mid_load(mode){
	ini_open(global.savefile + "save.ini");
	global.selected = ini_read_real(mode,"mid_selected",1);
	global.difficulty = ini_read_real(mode,"mid_difficulty",1);
	global.dif_user = ini_read_real(mode,"mid_user",1);
	room_goto(rm_game);
	ini_close();
	ob_full_control.alarm[0] = 1;
	ob_full_control.mode = mode;
}

function sc_stat(){
	if global.loaded
	{
		ini_open(global.savefile + "save.ini");
		ini_write_real("Stats","shot",global.stat_shot);
		ini_write_real("Stats","clear",global.stat_clear);
		ini_write_real("Stats","combo",global.stat_combo);
		ini_write_real("Stats","chain",global.stat_chain);
		ini_write_real("Stats","power",global.stat_power);
		ini_write_real("Stats","wins",global.stat_wins);
		ini_write_real("Stats","time",global.stat_time);
		ini_close();
	}
}