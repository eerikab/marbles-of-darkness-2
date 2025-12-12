// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Matching orbs
function sc_match(chain){
	if matched = true
	exit;
	
	with(ob_orb)
	matched = false;
	globalvar matches;
	matches = 1;
	matched = true;
	global.matching[pathnr] = 1;
	global.retract = false;
	
	globalvar match_colour;
	match_colour = colour;
	
	//Previous orb
	to_knockback = 0;
	global.match_pos = pos;
	sc_find(pathnr,index-1,-1);
	
	//Next orb
	match_colour = colour;
	global.match_pos = pos;
	sc_find(pathnr,index+1,1);
		
	//If enough matches, remove the orbs
	if matches >= 3 and !global.retract
	{
		if chain == 1
		{
			global.chain += 1;
			if global.chain >= 3
			point_get = (matches+global.chain-2)*100;
			else
			point_get = matches*100
		}
		else
		point_get = matches*100*combo
		sc_score(point_get,x,y,colour,chain,combo)
			
		var audio = audio_play_sound(global.sou_match,0,0);
		if combo == 2
		audio_sound_pitch(audio,13/12);
		else if combo == 3
		audio_sound_pitch(audio,14/12);
		else if combo == 4
		audio_sound_pitch(audio,15/12);
		else if combo == 5
		audio_sound_pitch(audio,16/12);
		else if combo == 6
		audio_sound_pitch(audio,17/12);
		else if combo > 6
		audio_sound_pitch(audio,18/12);
		if (chain == 1 and global.chain mod 3 == 0) or combo mod 3 == 0
		instance_create_depth(x,y,-100,ob_powerup,{
			colour : colour,
			direction : image_angle
			});
				
		var list_i = index - 1;
		if list_i >= 0
		{
			while list_i > 0 and global.ls_orbs[pathnr,list_i].colour == colour 
			list_i -= 1
			with (global.ls_orbs[pathnr,list_i])
			{
				if colour != match_colour
				combo = other.combo + 1;
			}
		}
			
		ob_knockback = global.ls_orbs[pathnr,to_knockback]
		other_index = global.ls_orbs[pathnr,to_knockback-1]
		if ob_knockback.pos > other_index.pos - 40/length
		{
			with(ob_knockback)
			{
				knockback = other.match_knockback;
			}
		}
		with(ob_orb)
		{
			if matched = true
			{
				global.level_progress += 1;
				instance_destroy();
			}
		}
	}
	else
	{
		combo = 1
		if chain = 1
		global.chain = 0
	}
		
	
	/*if pathnr == 1
	{
		index = ds_list_find_index(global.ds_id1,id);
		colour = ds_list_find_value(global.ds_col1,index);
		globalvar match_colour;
		match_colour = colour;
		length = path_get_length(global.path[pathnr]);
		
		//Previous orb
		to_knockback = 0;
		global.match_pos = pos;
		sc_find(pathnr,index-1,-1);
		
		//Next orb
		match_colour = colour;
		global.match_pos = pos;
		sc_find(pathnr,index+1,1);
		
		//If enough matches, remove the orbs
		if matches >= 3 and !global.retract
		{
			if chain == 1
			{
				global.chain += 1;
				if global.chain >= 3
				point_get = (matches+global.chain-2)*100;
				else
				point_get = matches*100
			}
			else
			point_get = matches*100*combo
			sc_score(point_get,x,y,colour,chain,combo)
			
			var audio = audio_play_sound(global.sou_match,0,0);
			if combo == 2
			audio_sound_pitch(audio,13/12);
			else if combo == 3
			audio_sound_pitch(audio,14/12);
			else if combo == 4
			audio_sound_pitch(audio,15/12);
			else if combo == 5
			audio_sound_pitch(audio,16/12);
			else if combo == 6
			audio_sound_pitch(audio,17/12);
			else if combo > 6
			audio_sound_pitch(audio,18/12);
			if (chain == 1 and global.chain mod 3 == 0) or combo mod 3 == 0
			instance_create_depth(x,y,-100,ob_powerup,{
				colour : colour,
				direction : image_angle
				});
				
			var list_i = index - 1;
			while list_i > 0 and ds_list_find_value(global.ds_col1,list_i) == colour 
			list_i -= 1
			with (ds_list_find_value(global.ds_id1,list_i))
			{
				if colour != match_colour
				combo = other.combo + 1;
			}
			
			ob_knockback = ds_list_find_value(global.ds_id1,to_knockback)
			if ds_list_find_value(global.ds_pos1,to_knockback) > ds_list_find_value(global.ds_pos1,to_knockback-1) - 40/length
			{
				with(ob_knockback)
				{
					knockback = other.match_knockback;
				}
			}
			with(ob_orb)
			{
				if matched = true
				{
					global.level_progress += 1;
					instance_destroy();
				}
			}
		}
		else
		{
			combo = 1
			if chain = 1
			global.chain = 0
		}
	}
	*/
	
	//Reset for next matches
	with(ob_orb)
	matched = false;
	
	match_knockback = 0;
}

function sc_find(_path,_index,_dir){
	//Stay in bounds
	if _index > -1 and _index < array_length(global.ls_orbs[pathnr])
	{
		length = path_get_length(global.path[1]);
		if (match_colour = global.ls_orbs[pathnr,_index].colour 
		or global.ls_orbs[pathnr,_index].colour == 11 or match_colour == 11)
		and global.ls_orbs[pathnr,_index].colour > 0
		{
			//If it has the same colour, match it
			with (global.ls_orbs[pathnr,_index])
			{
				matched = true;
				if match_colour == 11
				match_colour = colour;
				if colour == 11
				match_colour = 11;
			}
			matches += 1;
				
				
			if abs(global.ls_orbs[pathnr,_index].pos - global.match_pos) < 48/length
			{
				//Continue the check
				global.match_pos = global.ls_orbs[pathnr,_index].pos;
				sc_find(_path,_index + _dir,_dir);
			}
			else
			global.retract = true;
		}
		else
		{
			if _dir = 1
			to_knockback = _index;
		}
	}
	
	/*if _path == 1
	{
		//Stay in bounds
		if _index > -1 and _index < ds_list_size(global.ds_id1)
		{
			length = path_get_length(global.path[1]);
			if (match_colour = ds_list_find_value(global.ds_col1,_index) 
			or ds_list_find_value(global.ds_col1,_index) == 11 or match_colour == 11)
			and ds_list_find_value(global.ds_col1,_index) > 0
			{
				//If it has the same colour, match it
				with (ds_list_find_value(global.ds_id1,_index))
				{
					matched = true;
					if match_colour == 11
					match_colour = colour;
					if colour == 11
					match_colour = 11;
				}
				matches += 1;
				
				
				if abs(ds_list_find_value(global.ds_pos1,_index) - global.match_pos) < 48/length
				{
					//Continue the check
					global.match_pos = ds_list_find_value(global.ds_pos1,_index);
					sc_find(_path,_index + _dir,_dir);
				}
				else
				global.retract = true;
			}
			else
			{
				if _dir = 1
				to_knockback = _index;
			}
		}
	}*/
}