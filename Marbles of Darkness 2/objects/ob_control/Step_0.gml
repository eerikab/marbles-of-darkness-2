/// @description Move streams
// You can write your code in this editor

//Decrease buff time
if global.precise > 0
global.precise --;
if global.accuracy > 0
global.accuracy --;

//Loop through each path and each orb on it, control them
for (pathnr = 1; pathnr <= global.paths; pathnr++)
{
	global.matching[pathnr] = 0;
	
	for (index = array_length(global.ls_orbs[pathnr]) - 1; index >= 0; index--)
	{	
		if global.matching[pathnr]
		break;
		
		with(global.ls_orbs[pathnr,index])
		{
			index = other.index;
			path = global.path[pathnr];
			length = path_get_length(path);
			
			//Pusher
			if (object_index == ob_pusher)
			{
				//Destroy if isolated
				if (index == 0 or global.ls_orbs[pathnr,index-1].object_index == ob_pusher)
				{
					if global.game == 1
					{
						sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
					}
					instance_destroy();
					break;
				}
				
				if index < array_length(global.ls_orbs[pathnr]) - 1
				{
					other_index = global.ls_orbs[pathnr,index+1];
					if index < array_length( global.ls_orbs[pathnr]) - 1 and pos < other_index.pos + (40/length)
					{
						other_index = index + 1;
						orb = global.ls_orbs[pathnr,other_index];
						while other_index < array_length(global.ls_orbs[pathnr]) and instance_exists(orb) and orb.object_index != ob_pusher
						{
							other_index += 1;
							orb = global.ls_orbs[pathnr,other_index];
						}
						if instance_exists(orb) and orb.object_index == ob_pusher and orb.spd > (global.push_spd_const + length*global.push_spd_path)
						orb.spd = (global.push_spd_const + length*global.push_spd_path);
			
						instance_destroy();
					}
				}
				
				//Find the first orb of connected group
				other_pos = pos;
				other_index = index;
				loop = true;
		
				while loop
				{
					orb = global.ls_orbs[pathnr,other_index];
					if orb.pos > other_pos + 4/length 
					loop = false;
					other_index -= 1;
					other_pos += 32/length;
					if other_index == 0
					loop = false;
				}
				
				//Find the first orb of the segment
				other_index = index - 1;
				loop = true
				first_pos = pos
				first_orb = id;
				while loop
				{
					orb = global.ls_orbs[pathnr,other_index];
					if instance_exists(orb) and orb.object_index != ob_pusher
					{
						first_pos = orb.pos;
						first_orb = orb;
					}	
					else
					loop = false;
					if other_index == 0
					loop = false;
					other_index -= 1;
				}
				other_index += 1;
				first_index = other_index;
				
				if first_pos < 0 and pos < (index - first_index) * -32/length
				{
					// If the segment is knocked offscreen and no cascades are happening, speed up the recovery
					while other_index < index
					{
						if global.ls_orbs[pathnr,other_index].colour == global.ls_orbs[pathnr,other_index+1].colour
						and global.ls_orbs[pathnr,other_index].pos > 34/length + global.ls_orbs[pathnr,other_index+1].pos
						break;
						
						other_index += 1;
					}
					if other_index == index
					{
						while other_index >= first_index
						{
							//Reset orb knockback
							global.ls_orbs[pathnr,other_index].knockback = 0;
							other_index -= 1;
						}
						pos = (index - first_index) * -32/length;
					}
				}
				
		
				//Change speed
				if spd > max_spd and global.game
				{
					spd -= global.push_accel;
					if spd < max_spd
					{
						spd = max_spd;
					}
			
					if !instance_exists(ob_orbshot)
					{
						ob_shooter.colour = irandom_range(1, min(10, global.dif_col[global.difficulty]));
						instance_create_depth(x,y,-80,ob_orbshot);
					}
				}
				if first_pos < global.dif_len[global.difficulty] * global.path_multi * global.hardness
				or other_pos < 0
				max_spd = (global.push_boost_const + (length*global.push_boost_path)) * global.hardness;
				else if other_pos > 0.7
				{
					max_spd = (1-((other_pos-0.7)/0.375)) * (global.push_spd_const + length*global.push_spd_path) * global.path_multi * global.hardness;
				}
				else if max_spd != (global.push_spd_const + length*global.push_spd_path) * global.path_multi * global.hardness
				max_spd = (global.push_spd_const + length*global.push_spd_path) * global.path_multi * global.hardness;
				if global.game = 0
				spd += global.push_accel;
		
				//Debuffs
				if first_pos < 0
				{
					if power_reverse > 0
					power_reverse = 0;
					if stop > 0
					stop = 0;
					if slow > 0
					slow = 0;
				}
		
				if power_reverse > 0
				power_reverse --;
				if stop > 0
				stop --;
				if slow > 0
				slow --;
		
				if power_reverse > 0
				{
					max_spd = 0;
					with(first_orb)
					{
						if object_index == ob_orb
						{
							pos -= abs(global.push_spd_const + length*global.push_spd_path) * global.path_multi * global.hardness / length;
							other_pos = pos - 32/length;
							other_index = index + 1;
							if other_index < array_length(global.ls_orbs[pathnr]) 
							{
								orb = global.ls_orbs[pathnr,other_index];
								while other_index < array_length(global.ls_orbs[pathnr]) 
								and instance_exists(orb) and orb.object_index != ob_orbshot
								and global.ls_orbs[pathnr,other_index].pos > other_pos - 4/length
								{
									global.ls_orbs[pathnr,other_index].pos = other_pos;
								
									other_pos -= 32/length;
									if global.ls_orbs[pathnr,other_index].object_index == ob_orb
									other_index += 1;
									else
									break;
								}
							}
						}
					}
				}
				if stop > 0 or power_reverse > 0
				max_spd = 0;
				else if slow > 0
				max_spd /= 4;
		
				if spd < max_spd
				spd += global.push_accel;
		
				if spd > 0
				pos += spd/length;
				path_position = pos;
			}
			
			//Orbs and movement
			if object_index == ob_orbshot
			{
				//If it is a shot orb
				if counter > 0
				{
					//If it's still matching, transition onto the path
					counter -= 3.2
					temp_pos -= 3.2/length
					other_pos = global.ls_orbs[pathnr,index+1].pos;
					if temp_pos < other_pos
					temp_pos = other_pos;
					pos = temp_pos + (32-counter)/length
				
					xpos = path_get_x(path, pos);
					ypos = path_get_y(path, pos);
				
					x = xpos + lengthdir_x(match_length*counter/32, match_dir)
					y = ypos + lengthdir_y(match_length*counter/32, match_dir)
				}
				else
				{
					//If it's on the path, create a real orb
					array_delete(global.ls_orbs[pathnr],index,1);
					
					instance_create_layer(x,y,"Instances",ob_orb,
					{
						path : path,
						pathnr : pathnr,
						pos : pos,
						index : index,
						colour : colour
					});
					
					instance_destroy();
				}
				
			}
			else
			{
				//If it is a rolling orb, mov
				
				//Knockback
				if knockback != 0
				{
					global.match_pos = pos;
					i = index;
					while i < array_length(global.ls_orbs[pathnr])
					{
						j = global.ls_orbs[pathnr,i];
						if instance_exists(j) and j.object_index != ob_orbshot and j.pos >= global.match_pos - 34/length
						{
							global.match_pos = j.pos;
							j.pos -= abs(knockback/length);
							i += 1;
							if j.object_index = ob_pusher and j.spd > 0
							j.spd = 0;
						}
						else
						break;
					}
					knockback -= global.push_accel;
					if knockback < 0
					knockback = 0;
				}
				
				//Reverse
				if (index < array_length(global.ls_orbs[pathnr]) - 1 and pos > global.ls_orbs[pathnr,index+1].pos + (34/length) //Away from an orb
				and (colour == global.ls_orbs[pathnr,index+1].colour or global.ls_orbs[pathnr,index+1].colour = 0 //Matching colour
				or global.ls_orbs[pathnr,index+1].colour = 11 or colour == 11)) or reverse != 0 //Or wild
				{
					reverse += global.push_accel;
					i = index-1;
					global.match_pos = pos;
					while i > -1
					{
						j = global.ls_orbs[pathnr,i];
						if instance_exists(j) and j.object_index != ob_orbshot and j.pos <= global.match_pos+34/length
						{
							global.match_pos = j.pos 
							j.pos -= abs(reverse/length);
							i -= 1;
							if j.object_index = ob_pusher and j.spd > 0
							j.spd = 0;
						}
						else
						break;
					}
					pos -= reverse/length;
				}
				else if combo != 1
				combo = 1
						
				//Collision with orbs
				if index < array_length(global.ls_orbs[pathnr]) - 1
				{
					other_index = global.ls_orbs[pathnr,index+1];
					if pos < other_index.pos + (32/length)
					{
						pos = other_index.pos + (32/length);
						if reverse != 0 
						{
							//Knockback
							if other_index.object_index = ob_orb
							{
								match_knockback = reverse*global.knockback;
								alarm[0] = 1;
							
							}
							j = global.ls_orbs[pathnr, array_length(global.ls_orbs[pathnr])-1];
							if j.pos - (knockback/length) >= pos-(34/length*(j.index-index)) and j.spd > 0
							{
								j.spd = 0;
							}
							reverse = 0;
						}
					}
					path_position = pos;
				}
			}
		}
	}
}