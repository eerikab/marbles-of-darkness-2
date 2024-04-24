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
	if pathnr == 1
	ob_control.alarm[0] = 1;
	else if pathnr == 5
	ob_control.alarm[6] = 1;
	else
	ob_control.alarm[pathnr] = 1;
	global.retract = false;
	
	if pathnr == 1
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
	
	if pathnr == 2
	{
		index = ds_list_find_index(global.ds_id2,id);
		colour = ds_list_find_value(global.ds_col2,index);
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
			if (chain == 1 and global.chain mod 3 == 0) or combo mod 3 == 0
			instance_create_depth(x,y,-100,ob_powerup,{
				colour : colour,
				direction : image_angle
				});
				
			var list_i = index - 1;
			while list_i > 0 and ds_list_find_value(global.ds_col2,list_i) == colour 
			list_i -= 1
			with (ds_list_find_value(global.ds_id2,list_i))
			{
				if colour != match_colour
				combo = other.combo + 1;
			}
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
				
			ob_knockback = ds_list_find_value(global.ds_id2,to_knockback)
			if ds_list_find_value(global.ds_pos2,to_knockback) > ds_list_find_value(global.ds_pos2,to_knockback-1) - 40/length
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
	
	if pathnr == 3
	{
		index = ds_list_find_index(global.ds_id3,id);
		colour = ds_list_find_value(global.ds_col3,index);
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
			point_get = matches*100*combo;
			sc_score(point_get,x,y,colour,chain,combo);
			if (chain == 1 and global.chain mod 3 == 0) or combo mod 3 == 0
			instance_create_depth(x,y,-100,ob_powerup,{
				colour : colour,
				direction : image_angle
				});
				
			var list_i = index - 1;
			while list_i > 0 and ds_list_find_value(global.ds_col3,list_i) == colour 
			list_i -= 1
			with (ds_list_find_value(global.ds_id3,list_i))
			{
				if colour != match_colour
				combo = other.combo + 1;
			}
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
				
			
			ob_knockback = ds_list_find_value(global.ds_id3,to_knockback)
			if ds_list_find_value(global.ds_pos3,to_knockback) > ds_list_find_value(global.ds_pos3,to_knockback-1) - 40/length
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
	
	if pathnr == 4
	{
		index = ds_list_find_index(global.ds_id4,id);
		colour = ds_list_find_value(global.ds_col4,index);
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
			if (chain == 1 and global.chain mod 3 == 0) or combo mod 3 == 0
			instance_create_depth(x,y,-100,ob_powerup,{
				colour : colour,
				direction : image_angle
				});
				
			var list_i = index - 1;
			while list_i > 0 and ds_list_find_value(global.ds_col4,list_i) == colour 
			list_i -= 1
			with (ds_list_find_value(global.ds_id4,list_i))
			{
				if colour != match_colour
				combo = other.combo + 1;
			}
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
				
			
			ob_knockback = ds_list_find_value(global.ds_id4,to_knockback)
			if ds_list_find_value(global.ds_pos4,to_knockback) > ds_list_find_value(global.ds_pos4,to_knockback-1) - 40/length
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
	
	if pathnr == 5
	{
		index = ds_list_find_index(global.ds_id5,id);
		colour = ds_list_find_value(global.ds_col5,index);
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
			if (chain == 1 and global.chain mod 3 == 0) or combo mod 3 == 0
			instance_create_depth(x,y,-100,ob_powerup,{
				colour : colour,
				direction : image_angle
				});
				
			var list_i = index - 1;
			while list_i > 0 and ds_list_find_value(global.ds_col5,list_i) == colour 
			list_i -= 1
			with (ds_list_find_value(global.ds_id5,list_i))
			{
				if colour != match_colour
				combo = other.combo + 1;
			}
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
				
			
			ob_knockback = ds_list_find_value(global.ds_id5,to_knockback)
			if ds_list_find_value(global.ds_pos5,to_knockback) > ds_list_find_value(global.ds_pos5,to_knockback-1) - 40/length
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
	
	//Reset for next matches
	with(ob_orb)
	matched = false;
	
	match_knockback = 0;
}

function sc_find(_path,_index,_dir){
	if _path == 1
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
	}
	
	if _path == 2
	{
		//Stay in bounds
		if _index > -1 and _index < ds_list_size(global.ds_id2)
		{
			length = path_get_length(global.path[2]);
			if (match_colour = ds_list_find_value(global.ds_col2,_index)
			or ds_list_find_value(global.ds_col2,_index) == 11 or match_colour == 11)
			and ds_list_find_value(global.ds_col2,_index) > 0
			{
				//If it has the same colour, match it
				with (ds_list_find_value(global.ds_id2,_index))
				{
					matched = true;
					if match_colour == 11
					match_colour = colour;
					if colour == 11
					match_colour = 11;
				}
				matches += 1;
				
				if abs(ds_list_find_value(global.ds_pos2,_index) - global.match_pos) < 48/length
				{
					//Continue the check
					global.match_pos = ds_list_find_value(global.ds_pos2,_index)
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
	}
	
	if _path == 3
	{
		//Stay in bounds
		if _index > -1 and _index < ds_list_size(global.ds_id3)
		{
			length = path_get_length(global.path[3]);
			if (match_colour = ds_list_find_value(global.ds_col3,_index)
			or ds_list_find_value(global.ds_col3,_index) == 11 or match_colour == 11)
			and ds_list_find_value(global.ds_col3,_index) > 0
			{
				//If it has the same colour, match it
				with (ds_list_find_value(global.ds_id3,_index))
				{
					matched = true;
					if match_colour == 11
					match_colour = colour;
					if colour == 11
					match_colour = 11;
				}
				matches += 1;
				
				if abs(ds_list_find_value(global.ds_pos3,_index) - global.match_pos) < 48/length
				{
					//Continue the check
					global.match_pos = ds_list_find_value(global.ds_pos3,_index)
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
	}
	
	if _path == 4
	{
		//Stay in bounds
		if _index > -1 and _index < ds_list_size(global.ds_id4)
		{
			length = path_get_length(global.path[4]);
			if (match_colour = ds_list_find_value(global.ds_col4,_index)
			or ds_list_find_value(global.ds_col4,_index) == 11 or match_colour == 11)
			and ds_list_find_value(global.ds_col4,_index) > 0
			{
				//If it has the same colour, match it
				with (ds_list_find_value(global.ds_id4,_index))
				{
					matched = true;
					if match_colour == 11
					match_colour = colour;
					if colour == 11
					match_colour = 11;
				}
				matches += 1;
				
				if abs(ds_list_find_value(global.ds_pos4,_index) - global.match_pos) < 48/length
				{
					//Continue the check
					global.match_pos = ds_list_find_value(global.ds_pos4,_index)
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
	}
	
	if _path == 5
	{
		//Stay in bounds
		if _index > -1 and _index < ds_list_size(global.ds_id5)
		{
			length = path_get_length(global.path[5]);
			if (match_colour = ds_list_find_value(global.ds_col5,_index)
			or ds_list_find_value(global.ds_col5,_index) == 11 or match_colour == 11)
			and ds_list_find_value(global.ds_col5,_index) > 0
			{
				//If it has the same colour, match it
				with (ds_list_find_value(global.ds_id5,_index))
				{
					matched = true;
					if match_colour == 11
					match_colour = colour;
					if colour == 11
					match_colour = 11;
				}
				matches += 1;
				
				if abs(ds_list_find_value(global.ds_pos5,_index) - global.match_pos) < 48/length
				{
					//Continue the check
					global.match_pos = ds_list_find_value(global.ds_pos5,_index)
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
	}
}