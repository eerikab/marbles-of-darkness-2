/// @description Move streams
// You can write your code in this editor

//Decrease buff time
if global.reverse > 0
global.reverse --;
if global.stop > 0
global.stop --;
if global.slow > 0
global.slow --;
if global.precise > 0
global.precise --;
if global.accuracy > 0
global.accuracy --;

//Move pushers
with(ob_pusher)
{
	//First Path
	if pathnr == 1
	{
		index = ds_list_find_index(global.ds_id1,id);
		
		//Destroy if isolated
		if index = 0
		{
			if global.game == 1
			{
				sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
			}
			instance_destroy();
			break;
		}
		
		other_index = ds_list_find_value(global.ds_id1,index - 1);
		if instance_exists(other_index) and other_index.object_index == ob_pusher
		{
			if global.game == 1
			{
				sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
			}
			instance_destroy();
			break;
		}
		
		if index < ds_list_size(global.ds_pos1) - 1 and pos < ds_list_find_value(global.ds_pos1,index+1) + (40/length)
		{
			other_index = index + 1;
			orb = ds_list_find_value(global.ds_id1,other_index);
			while other_index < ds_list_size(global.ds_id1) and instance_exists(orb) and orb.object_index != ob_pusher
			{
				other_index += 1;
				orb = ds_list_find_value(global.ds_id1,other_index);
			}
			if instance_exists(orb) and orb.object_index == ob_pusher and orb.spd > (global.push_spd_const + length*global.push_spd_path)
			orb.spd = (global.push_spd_const + length*global.push_spd_path);
			
			instance_destroy();
		}
		
		//Find the first orb of the group
		other_pos = pos;
		other_index = index;
		loop = true;
		
		while loop
		{
			orb = ds_list_find_value(global.ds_id1,other_index);
			if orb.pos > other_pos + 4/length 
			loop = false;
			other_index -= 1;
			other_pos += 32/length;
			if other_index == 0
			loop = false;
		}
		
		other_index = index - 1;
		loop = true
		first_pos = pos
		while loop
		{
			orb = ds_list_find_value(global.ds_id1,other_index);
			if instance_exists(orb) and orb.object_index != ob_pusher
			first_pos = orb.pos;
			else
			loop = false;
			if other_index == 0
			loop = false
			other_index -= 1;
		}
		
		//Change speed
		if spd > max_spd and global.game = 1
		{
			spd -= global.push_accel;
			if spd < max_spd
			{
				spd = max_spd;
			}
			
			if !instance_exists(ob_orbshot)
			{
				ob_shooter.colour = irandom_range(1, min(10, global.dif_col[global.difficulty]));
				instance_create_depth(x,y,-10,ob_orbshot);
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
			index = ds_list_find_index(global.ds_id1,id);
			first_orb = ds_list_find_value(global.ds_id1, ds_list_find_index(global.ds_pos1,first_pos));
			with(first_orb)
			{
				if object_index == ob_orb
				{
					pos -= (global.push_spd_const + length*global.push_spd_path) * global.path_multi * global.hardness / length;
					other_pos = pos - 32/length;
					other_index = index + 1;
					orb = ds_list_find_value(global.ds_id1,other_index);
					while other_index < ds_list_size(global.ds_pos1) 
					and instance_exists(orb) and orb.object_index != ob_orbshot
					and ds_list_find_value(global.ds_pos1,other_index) > other_pos - 4/length
					{
						ds_list_find_value(global.ds_id1,other_index).pos = other_pos;
						ds_list_replace(global.ds_pos1,other_index,other_pos);
						other_pos -= 32/length;
						if ds_list_find_value(global.ds_id1,other_index).object_index == ob_orb
						other_index += 1;
						else
						break;
					}
				}
			}
		}
		if stop > 0 or power_reverse > 0
		max_spd = 0;
		else if slow > 0
		max_spd /= 4;
		
		//Knockback
		if knockback > 0
		{
			pos -= knockback/length;
			knockback -= global.push_accel;
			if knockback < 0
			knockback = 0;
			spd = 0;
		}

		
		if spd < max_spd
		spd += global.push_accel;
		
		if spd > 0
		pos += spd/length;
		ds_list_replace(global.ds_pos1,index,pos);
		path_position = pos;
	}
	
	//Second Path
	if pathnr == 2
	{
		index = ds_list_find_index(global.ds_id2,id);
		
		//Destroy if isolated
		if index = 0
		{
			if global.game == 1
			{
				sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
			}
			instance_destroy();
			break;
		}
		
		other_index = ds_list_find_value(global.ds_id2,index - 1);
		if instance_exists(other_index) and other_index.object_index == ob_pusher
		{
			if global.game == 1
			{
				sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
			}
			instance_destroy();
			break;
		}
		
		if index < ds_list_size(global.ds_pos2) - 1 and pos < ds_list_find_value(global.ds_pos2,index+1) + (40/length)
		{
			other_index = index + 1;
			orb = ds_list_find_value(global.ds_id2,other_index);
			while other_index < ds_list_size(global.ds_id2) and instance_exists(orb) and orb.object_index != ob_pusher
			{
				other_index += 1;
				orb = ds_list_find_value(global.ds_id2,other_index);
			}
			if instance_exists(orb) and orb.object_index == ob_pusher and orb.spd > (global.push_spd_const + length*global.push_spd_path)
			orb.spd = (global.push_spd_const + length*global.push_spd_path);
			
			instance_destroy();
		}
		
		//Find the first orb of the group
		other_pos = pos;
		other_index = index;
		loop = true;
		
		while loop
		{
			orb = ds_list_find_value(global.ds_id2,other_index);
			if orb.pos > other_pos + 4/length 
			loop = false;
			other_index -= 1;
			other_pos += 32/length;
			if other_index == 0
			loop = false;
		}
		
		other_index = index - 1;
		loop = true
		first_pos = pos
		while loop
		{
			orb = ds_list_find_value(global.ds_id2,other_index);
			if instance_exists(orb) and orb.object_index != ob_pusher
			first_pos = orb.pos;
			else
			loop = false;
			if other_index == 0
			loop = false
			other_index -= 1;
		}
		
		//Change speed
		if spd > max_spd and global.game = 1
		{
			spd -= global.push_accel;
			if spd < max_spd
			{
				spd = max_spd;
			}
			
			if !instance_exists(ob_orbshot)
			{
				ob_shooter.colour = irandom_range(1, min(10, global.dif_col[global.difficulty]));
				instance_create_depth(x,y,-10,ob_orbshot);
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
			max_spd =  0;
			index = ds_list_find_index(global.ds_id2,id);
			first_orb = ds_list_find_value(global.ds_id2, ds_list_find_index(global.ds_pos2,first_pos));
			with(first_orb)
			{
				if object_index == ob_orb
				{
					pos -= (global.push_spd_const + length*global.push_spd_path) * global.path_multi * global.hardness / length;
					other_pos = pos - 32/length;
					other_index = index + 1;
					orb = ds_list_find_value(global.ds_id2,other_index);
					while other_index < ds_list_size(global.ds_pos2) 
					and instance_exists(orb) and orb.object_index != ob_orbshot
					and ds_list_find_value(global.ds_pos2,other_index) > other_pos - 4/length
					{
						ds_list_find_value(global.ds_id2,other_index).pos = other_pos;
						ds_list_replace(global.ds_pos2,other_index,other_pos);
						other_pos -= 32/length;
						if ds_list_find_value(global.ds_id2,other_index).object_index == ob_orb
						other_index += 1;
						else
						break;
					}
				}
			}
		}
		if stop > 0 or power_reverse > 0
		max_spd = 0;
		else if slow > 0
		max_spd /= 4;
		
		//Knockback
		if knockback > 0
		{
			pos -= knockback/length;
			knockback -= global.push_accel;
			if knockback < 0
			knockback = 0;
			spd = 0;
		}

		
		if spd < max_spd
		spd += global.push_accel;
		
		if spd > 0
		pos += spd/length;
		ds_list_replace(global.ds_pos2,index,pos);
		path_position = pos;
	}
	
	//Third Path
	if pathnr == 3
	{
		index = ds_list_find_index(global.ds_id3,id);
		
		//Destroy if isolated
		if index = 0
		{
			if global.game == 1
			{
				sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
			}
			instance_destroy();
			break;
		}
		
		other_index = ds_list_find_value(global.ds_id3,index - 1);
		if instance_exists(other_index) and other_index.object_index == ob_pusher
		{
			if global.game == 1
			{
				sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
			}
			instance_destroy();
			break;
		}
		
		if index < ds_list_size(global.ds_pos3) - 1 and pos < ds_list_find_value(global.ds_pos3,index+1) + (40/length)
		{
			other_index = index + 1;
			orb = ds_list_find_value(global.ds_id3,other_index);
			while other_index < ds_list_size(global.ds_id3) and instance_exists(orb) and orb.object_index != ob_pusher
			{
				other_index += 1;
				orb = ds_list_find_value(global.ds_id3,other_index);
			}
			if instance_exists(orb) and orb.object_index == ob_pusher and orb.spd > (global.push_spd_const + length*global.push_spd_path)
			orb.spd = (global.push_spd_const + length*global.push_spd_path);
			
			instance_destroy();
		}
		
		//Find the first orb of the group
		other_pos = pos;
		other_index = index;
		loop = true;
		
		while loop
		{
			orb = ds_list_find_value(global.ds_id3,other_index);
			if orb.pos > other_pos + 4/length 
			loop = false;
			other_index -= 1;
			other_pos += 32/length;
			if other_index == 0
			loop = false;
		}
		
		other_index = index - 1;
		loop = true
		first_pos = pos
		while loop
		{
			orb = ds_list_find_value(global.ds_id3,other_index);
			if instance_exists(orb) and orb.object_index != ob_pusher
			first_pos = orb.pos;
			else
			loop = false;
			if other_index == 0
			loop = false
			other_index -= 1;
		}
		
		//Change speed
		if spd > max_spd and global.game = 1
		{
			spd -= global.push_accel;
			if spd < max_spd
			{
				spd = max_spd;
			}
			
			if !instance_exists(ob_orbshot)
			{
				ob_shooter.colour = irandom_range(1, min(10, global.dif_col[global.difficulty]));
				instance_create_depth(x,y,-10,ob_orbshot);
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
			max_spd =  0;
			index = ds_list_find_index(global.ds_id3,id);
			first_orb = ds_list_find_value(global.ds_id3, ds_list_find_index(global.ds_pos3,first_pos));
			with(first_orb)
			{
				if object_index == ob_orb
				{
					pos -= (global.push_spd_const + length*global.push_spd_path) * global.path_multi * global.hardness / length;
					other_pos = pos - 32/length;
					other_index = index + 1;
					orb = ds_list_find_value(global.ds_id1,other_index);
					while other_index < ds_list_size(global.ds_pos3) 
					and instance_exists(orb) and orb.object_index != ob_orbshot
					and ds_list_find_value(global.ds_pos3,other_index) > other_pos - 4/length
					{
						ds_list_find_value(global.ds_id3,other_index).pos = other_pos;
						ds_list_replace(global.ds_pos3,other_index,other_pos);
						other_pos -= 32/length;
						if ds_list_find_value(global.ds_id3,other_index).object_index == ob_orb
						other_index += 1;
						else
						break;
					}
				}
			}
		}
		if stop > 0 or power_reverse > 0
		max_spd = 0;
		else if slow > 0
		max_spd /= 4;
		
		//Knockback
		if knockback > 0
		{
			pos -= knockback/length;
			knockback -= global.push_accel;
			if knockback < 0
			knockback = 0;
			spd = 0;
		}

		
		if spd < max_spd
		spd += global.push_accel;
		
		if spd > 0
		pos += spd/length;
		ds_list_replace(global.ds_pos3,index,pos);
		path_position = pos;
	}
	
	//Fourth Path
	if pathnr == 4
	{
		index = ds_list_find_index(global.ds_id4,id);
		
		//Destroy if isolated
		if index = 0
		{
			if global.game == 1
			{
				sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
			}
			instance_destroy();
			break;
		}
		
		other_index = ds_list_find_value(global.ds_id4,index - 1);
		if instance_exists(other_index) and other_index.object_index == ob_pusher
		{
			if global.game == 1
			{
				sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
			}
			instance_destroy();
			break;
		}
		
		if index < ds_list_size(global.ds_pos4) - 1 and pos < ds_list_find_value(global.ds_pos4,index+1) + (40/length)
		{
			other_index = index + 1;
			orb = ds_list_find_value(global.ds_id4,other_index);
			while other_index < ds_list_size(global.ds_id4) and instance_exists(orb) and orb.object_index != ob_pusher
			{
				other_index += 1;
				orb = ds_list_find_value(global.ds_id4,other_index);
			}
			if instance_exists(orb) and orb.object_index == ob_pusher and orb.spd > (global.push_spd_const + length*global.push_spd_path)
			orb.spd = (global.push_spd_const + length*global.push_spd_path);
			
			instance_destroy();
		}
		
		//Find the first orb of the group
		other_pos = pos;
		other_index = index;
		loop = true;
		
		while loop
		{
			orb = ds_list_find_value(global.ds_id4,other_index);
			if orb.pos > other_pos + 4/length 
			loop = false;
			other_index -= 1;
			other_pos += 32/length;
			if other_index == 0
			loop = false;
		}
		
		other_index = index - 1;
		loop = true
		first_pos = pos
		while loop
		{
			orb = ds_list_find_value(global.ds_id4,other_index);
			if instance_exists(orb) and orb.object_index != ob_pusher
			first_pos = orb.pos;
			else
			loop = false;
			if other_index == 0
			loop = false
			other_index -= 1;
		}
		
		//Change speed
		if spd > max_spd and global.game = 1
		{
			spd -= global.push_accel;
			if spd < max_spd
			{
				spd = max_spd;
			}
			
			if !instance_exists(ob_orbshot)
			{
				ob_shooter.colour = irandom_range(1, min(10, global.dif_col[global.difficulty]));
				instance_create_depth(x,y,-10,ob_orbshot);
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
			index = ds_list_find_index(global.ds_id4,id);
			first_orb = ds_list_find_value(global.ds_id4, ds_list_find_index(global.ds_pos4,first_pos));
			with(first_orb)
			{
				if object_index == ob_orb
				{
					pos -= (global.push_spd_const + length*global.push_spd_path) * global.path_multi * global.hardness / length;
					other_pos = pos - 32/length;
					other_index = index + 1;
					orb = ds_list_find_value(global.ds_id4,other_index);
					while other_index < ds_list_size(global.ds_pos4) 
					and instance_exists(orb) and orb.object_index != ob_orbshot
					and ds_list_find_value(global.ds_pos4,other_index) > other_pos - 4/length
					{
						ds_list_find_value(global.ds_id4,other_index).pos = other_pos;
						ds_list_replace(global.ds_pos4,other_index,other_pos);
						other_pos -= 32/length;
						if ds_list_find_value(global.ds_id4,other_index).object_index == ob_orb
						other_index += 1;
						else
						break;
					}
				}
			}
		}
		if stop > 0 or power_reverse > 0
		max_spd = 0;
		else if slow > 0
		max_spd /= 4;
		
		//Knockback
		if knockback > 0
		{
			pos -= knockback/length;
			knockback -= global.push_accel;
			if knockback < 0
			knockback = 0;
			spd = 0;
		}

		
		if spd < max_spd
		spd += global.push_accel;
		
		if spd > 0
		pos += spd/length;
		ds_list_replace(global.ds_pos4,index,pos);
		path_position = pos;
	}
	
	//Fifth Path
	if pathnr == 5
	{
		index = ds_list_find_index(global.ds_id5,id);
		
		//Destroy if isolated
		if index = 0
		{
			if global.game == 1
			{
				sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
			}
			instance_destroy();
			break;
		}
		
		other_index = ds_list_find_value(global.ds_id5,index - 1);
		if instance_exists(other_index) and other_index.object_index == ob_pusher
		{
			if global.game == 1
			{
				sc_score(global.dif_point[global.difficulty]*global.hardness, x, y, 0, 0, 1);
			}
			instance_destroy();
			break;
		}
		
		if index < ds_list_size(global.ds_pos5) - 1 and pos < ds_list_find_value(global.ds_pos5,index+1) + (40/length)
		{
			other_index = index + 1;
			orb = ds_list_find_value(global.ds_id5,other_index);
			while other_index < ds_list_size(global.ds_id5) and instance_exists(orb) and orb.object_index != ob_pusher
			{
				other_index += 1;
				orb = ds_list_find_value(global.ds_id5,other_index);
			}
			if orb.object_index == ob_pusher and orb.spd > (global.push_spd_const + length*global.push_spd_path)
			orb.spd = (global.push_spd_const + length*global.push_spd_path);
			
			instance_destroy();
		}
		
		//Find the first orb of the group
		other_pos = pos;
		other_index = index;
		loop = true;
		
		while loop
		{
			orb = ds_list_find_value(global.ds_id5,other_index);
			if orb.pos > other_pos + 4/length 
			loop = false;
			other_index -= 1;
			other_pos += 32/length;
			if other_index == 0
			loop = false;
		}
		
		other_index = index - 1;
		loop = true
		first_pos = pos
		while loop
		{
			orb = ds_list_find_value(global.ds_id5,other_index);
			if instance_exists(orb) and orb.object_index != ob_pusher
			first_pos = orb.pos;
			else
			loop = false;
			if other_index == 0
			loop = false
			other_index -= 1;
		}
		
		//Change speed
		if spd > max_spd and global.game = 1
		{
			spd -= global.push_accel;
			if spd < max_spd
			{
				spd = max_spd;
			}
			
			if !instance_exists(ob_orbshot)
			{
				ob_shooter.colour = irandom_range(1, min(10, global.dif_col[global.difficulty]));
				instance_create_depth(x,y,-10,ob_orbshot);
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
			index = ds_list_find_index(global.ds_id5,id);
			first_orb = ds_list_find_value(global.ds_id5, ds_list_find_index(global.ds_pos5,first_pos));
			with(first_orb)
			{
				if object_index == ob_orb
				{
					pos -= (global.push_spd_const + length*global.push_spd_path) * global.path_multi * global.hardness / length;
					other_pos = pos - 32/length;
					other_index = index + 1;
					orb = ds_list_find_value(global.ds_id5,other_index);
					while other_index < ds_list_size(global.ds_pos5) 
					and instance_exists(orb) and orb.object_index != ob_orbshot
					and ds_list_find_value(global.ds_pos5,other_index) > other_pos - 4/length
					{
						ds_list_find_value(global.ds_id5,other_index).pos = other_pos;
						ds_list_replace(global.ds_pos5,other_index,other_pos);
						other_pos -= 32/length;
						if ds_list_find_value(global.ds_id5,other_index).object_index == ob_orb
						other_index += 1;
						else
						break;
					}
				}
			}
		}
		if stop > 0 or power_reverse > 0
		max_spd = 0;
		else if slow > 0
		max_spd /= 4;
		
		//Knockback
		if knockback > 0
		{
			pos -= knockback/length;
			knockback -= global.push_accel;
			if knockback < 0
			knockback = 0;
			spd = 0;
		}

		
		if spd < max_spd
		spd += global.push_accel;
		
		if spd > 0
		pos += spd/length;
		ds_list_replace(global.ds_pos5,index,pos);
		path_position = pos;
	}
}

//Orb movement
//First path
i = ds_list_size(global.ds_pos1)-2;
while(i>-1)
{
	if global.matching[1] = 1
	break;
	if instance_exists(ds_list_find_value(global.ds_id1,i))
	{
		with(ds_list_find_value(global.ds_id1,i))
		{
			index = ds_list_find_index(global.ds_id1,id);
			if object_index = ob_orbshot
			{
				//If it is a shot orb
				if counter > 0
				{
					//If it's still matching, transition onto the path
					counter -= 3.2
					temp_pos -= 3.2/length
					other_pos = ds_list_find_value(global.ds_pos1,index+1);
					if temp_pos < other_pos
					temp_pos = other_pos;
					pos = temp_pos + (32-counter)/length
					ds_list_replace(global.ds_pos1, index, pos);
				
					xpos = path_get_x(path, pos);
					ypos = path_get_y(path, pos);
				
					x = xpos + lengthdir_x(match_length*counter/32, match_dir)
					y = ypos + lengthdir_y(match_length*counter/32, match_dir)
				}
				else
				{
					//If it's on the path, create a real orb
					ds_list_delete(global.ds_id1,index);
					ds_list_delete(global.ds_pos1,index);
					ds_list_delete(global.ds_col1,index);
					
					instance_create_layer(x,y,"Instances",ob_orb,
					{
						path : path,
						pathnr : pathnr,
						pos : pos,
						index : index,
						colour : colour
					});
					
					global.matching[1] = 1;
					ob_control.alarm[0] = 1;
					instance_destroy();
				}
				
			}
			else
			{
				//If it is a rolling orb, move
				
				//Knockback
				if knockback > 0
				{
					global.match_pos = pos;
					i = index+1;
					while i < ds_list_size(global.ds_id1)
					{
						j = ds_list_find_value(global.ds_id1,i);
						if instance_exists(j) and j.object_index != ob_orbshot and j.pos >= global.match_pos - 34/length
						{
							global.match_pos = j.pos;
							j.pos -= knockback/length;
							i += 1;
							if j.object_index = ob_pusher and j.spd > 0
							j.spd = 0;
						}
						else
						break;
					}
					pos -= knockback/length;
					knockback -= global.push_accel;
					if knockback < 0
					knockback = 0
					
				}
				
				//Reverse
				if (index < ds_list_size(global.ds_id1) - 1 and pos > ds_list_find_value(global.ds_pos1,index+1) + (34/length)
				and (colour == ds_list_find_value(global.ds_col1,index+1) or ds_list_find_value(global.ds_col1,index+1) = 0
				or ds_list_find_value(global.ds_col1,index+1) = 11 or colour == 11)) or reverse != 0
				{
					reverse += global.push_accel;
					i = index-1;
					global.match_pos = pos;
					while i > -1
					{
						j = ds_list_find_value(global.ds_id1,i);
						if instance_exists(j) and j.object_index != ob_orbshot and j.pos <= global.match_pos+40/length
						{
							global.match_pos = j.pos 
							j.pos -= reverse/length;
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
				k = ds_list_find_value(global.ds_id1, index+1);
				if index < ds_list_size(global.ds_pos1) - 1 and pos < ds_list_find_value(global.ds_pos1,index+1) + (32/length)
				{
					pos = ds_list_find_value(global.ds_pos1,index+1) + (32/length);
					if reverse != 0 
					{
						//Knockback
						k = ds_list_find_value(global.ds_id1, index+1);
						if instance_exists(k) and k.object_index = ob_orb
						{
							match_knockback = reverse*1.5;
							alarm[0] = 1;
							
						}
						j = ds_list_find_value(global.ds_id1, ds_list_size(global.ds_id1)-1);
						if j.pos - (knockback/length) >= pos-(33/length*(j.index-index)) and j.spd > 0
						{
							j.spd = 0;
						}
						reverse = 0;
					}
				}
				ds_list_replace(global.ds_pos1,index,pos);
				path_position = pos;
			}
		}
	}
	i -= 1;
}

//Second path
i = ds_list_size(global.ds_pos2)-2;
while(i>-1)
{
	if global.matching[2] == 1
	break;
	if instance_exists(ds_list_find_value(global.ds_id2,i))
	{
		with(ds_list_find_value(global.ds_id2,i))
		{
			index = ds_list_find_index(global.ds_id2,id);
			if object_index = ob_orbshot
			{
				//If it is a shot orb
				if counter > 0
				{
					//If it's still matching
					counter -= 3.2
					temp_pos -= 3.2/length
					other_pos = ds_list_find_value(global.ds_pos2,index+1);
					if temp_pos < other_pos
					temp_pos = other_pos;
					pos = temp_pos + (32-counter)/length
					ds_list_replace(global.ds_pos2, index, pos);
				
					xpos = path_get_x(path, pos);
					ypos = path_get_y(path, pos);
				
					x = xpos + lengthdir_x(match_length*counter/32, match_dir)
					y = ypos + lengthdir_y(match_length*counter/32, match_dir)
				}
				else
				{
					//If it's on the path, create a real orb
					ds_list_delete(global.ds_id2,index);
					ds_list_delete(global.ds_pos2,index);
					ds_list_delete(global.ds_col2,index);
					
					instance_create_layer(x,y,"Instances",ob_orb,
					{
						path : path,
						pathnr : pathnr,
						pos : pos,
						index : index,
						colour : colour
					});
					
					global.matching[2] = 1;
					ob_control.alarm[2] = 1;
					instance_destroy();
				}
				
			}
			else
			{
				//If it is a rolling orb, move
				
				//Knockback
				if knockback > 0
				{
					global.match_pos = pos;
					i = index+1;
					while i < ds_list_size(global.ds_id2)
					{
						j = ds_list_find_value(global.ds_id2,i);
						if instance_exists(j) and j.object_index != ob_orbshot and j.pos >= global.match_pos - 34/length
						{
							global.match_pos = j.pos;
							j.pos -= knockback/length;
							i += 1;
							if j.object_index = ob_pusher and j.spd > 0
							j.spd = 0;
						}
						else
						break;
					}
					pos -= knockback/length;
					knockback -= global.push_accel;
					if knockback < 0
					knockback = 0
					
				}
				
				//Reverse
				if (index < ds_list_size(global.ds_id2) - 1 and pos > ds_list_find_value(global.ds_pos2,index+1) + (34/length)
				and (colour == ds_list_find_value(global.ds_col2,index+1) or ds_list_find_value(global.ds_col2,index+1) = 0
				or ds_list_find_value(global.ds_col2,index+1) = 11 or colour == 11)) or reverse != 0
				{
					reverse += global.push_accel;
					i = index-1;
					global.match_pos = pos;
					while i > -1
					{
						j = ds_list_find_value(global.ds_id2,i);
						if instance_exists(j) and j.object_index != ob_orbshot and j.pos <= global.match_pos+40/length
						{
							global.match_pos = j.pos 
							j.pos -= reverse/length;
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
				k = ds_list_find_value(global.ds_id2, index+1);
				if index < ds_list_size(global.ds_pos2) - 1 and pos < ds_list_find_value(global.ds_pos2,index+1) + (32/length)
				{
					pos = ds_list_find_value(global.ds_pos2,index+1) + (32/length);
					if reverse != 0 
					{
						//Knockback
						k = ds_list_find_value(global.ds_id2, index+1);
						if instance_exists(k) and k.object_index = ob_orb
						{
							match_knockback = reverse*1.5;
							alarm[0] = 1;
							//global.matching[1] = 1;
							
						}
						j = ds_list_find_value(global.ds_id2, ds_list_size(global.ds_id2)-1);
						if j.pos - (knockback/length) >= pos-(33/length*(j.index-index)) and j.spd > 0
						{
							j.spd = 0;
						}
						reverse = 0;
					}
				}
				ds_list_replace(global.ds_pos2,index,pos);
				path_position = pos;
			}
		}
	}
	i -= 1;
}

//Third path
i = ds_list_size(global.ds_pos3)-2;
while(i>-1)
{
	if global.matching[3] = 1
	break;
	if instance_exists(ds_list_find_value(global.ds_id3,i))
	{
		with(ds_list_find_value(global.ds_id3,i))
		{
			index = ds_list_find_index(global.ds_id3,id);
			if object_index = ob_orbshot
			{
				//If it is a shot orb
				if counter > 0
				{
					//If it's still matching
					counter -= 3.2
					temp_pos -= 3.2/length
					other_pos = ds_list_find_value(global.ds_pos3,index+1);
					if temp_pos < other_pos
					temp_pos = other_pos;
					pos = temp_pos + (32-counter)/length
					ds_list_replace(global.ds_pos3, index, pos);
				
					xpos = path_get_x(path, pos);
					ypos = path_get_y(path, pos);
				
					x = xpos + lengthdir_x(match_length*counter/32, match_dir)
					y = ypos + lengthdir_y(match_length*counter/32, match_dir)
				}
				else
				{
					//If it's on the path, create a real orb
					ds_list_delete(global.ds_id3,index);
					ds_list_delete(global.ds_pos3,index);
					ds_list_delete(global.ds_col3,index);
					
					instance_create_layer(x,y,"Instances",ob_orb,
					{
						path : path,
						pathnr : pathnr,
						pos : pos,
						index : index,
						colour : colour
					});
					
					global.matching[3] = 1;
					ob_control.alarm[3] = 1;
					instance_destroy();
				}
				
			}
			else
			{
				//If it is a rolling orb, move
				
				//Knockback
				if knockback > 0
				{
					global.match_pos = pos;
					i = index+1;
					while i < ds_list_size(global.ds_id3)
					{
						j = ds_list_find_value(global.ds_id3,i);
						if j.object_index != ob_orbshot and j.pos >= global.match_pos - 34/length
						{
							global.match_pos = j.pos;
							j.pos -= knockback/length;
							i += 1;
							if j.object_index = ob_pusher and j.spd > 0
							j.spd = 0;
						}
						else
						break;
					}
					pos -= knockback/length;
					knockback -= global.push_accel;
					if knockback < 0
					knockback = 0
					
				}
				
				//Reverse
				if (index < ds_list_size(global.ds_id3) - 1 and pos > ds_list_find_value(global.ds_pos3,index+1) + (34/length)
				and (colour == ds_list_find_value(global.ds_col3,index+1) or ds_list_find_value(global.ds_col3,index+1) = 0
				or ds_list_find_value(global.ds_col3,index+1) = 11 or colour == 11)) or reverse != 0
				{
					reverse += global.push_accel;
					i = index-1;
					global.match_pos = pos;
					while i > -1
					{
						j = ds_list_find_value(global.ds_id3,i);
						if j.object_index != ob_orbshot and j.pos <= global.match_pos+40/length
						{
							global.match_pos = j.pos 
							j.pos -= reverse/length;
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
				k = ds_list_find_value(global.ds_id3, index+1);
				if index < ds_list_size(global.ds_pos3) - 1 and pos < ds_list_find_value(global.ds_pos3,index+1) + (32/length)
				{
					pos = ds_list_find_value(global.ds_pos3,index+1) + (32/length);
					if reverse != 0 
					{
						//Knockback
						k = ds_list_find_value(global.ds_id3, index+1);
						if k.object_index = ob_orb
						{
							match_knockback = reverse*1.5;
							alarm[0] = 1;
							//global.matching[1] = 1;
							
						}
						j = ds_list_find_value(global.ds_id3, ds_list_size(global.ds_id3)-1);
						if j.pos - (knockback/length) >= pos-(33/length*(j.index-index)) and j.spd > 0
						{
							j.spd = 0;
						}
						reverse = 0;
					}
				}
				ds_list_replace(global.ds_pos3,index,pos);
				path_position = pos;
			}
		}
	}
	i -= 1;
}

//Fourth path
i = ds_list_size(global.ds_pos4)-2;
while(i>-1)
{
	if global.matching[4] = 1
	break;
	if instance_exists(ds_list_find_value(global.ds_id4,i))
	{
		with(ds_list_find_value(global.ds_id4,i))
		{
			index = ds_list_find_index(global.ds_id4,id);
			if object_index = ob_orbshot
			{
				//If it is a shot orb
				if counter > 0
				{
					//If it's still matching
					counter -= 3.2
					temp_pos -= 3.2/length
					other_pos = ds_list_find_value(global.ds_pos4,index+1);
					if temp_pos < other_pos
					temp_pos = other_pos;
					pos = temp_pos + (32-counter)/length
					ds_list_replace(global.ds_pos4, index, pos);
				
					xpos = path_get_x(path, pos);
					ypos = path_get_y(path, pos);
				
					x = xpos + lengthdir_x(match_length*counter/32, match_dir);
					y = ypos + lengthdir_y(match_length*counter/32, match_dir);
				}
				else
				{
					//If it's on the path, create a real orb
					ds_list_delete(global.ds_id4,index);
					ds_list_delete(global.ds_pos4,index);
					ds_list_delete(global.ds_col4,index);
					
					instance_create_layer(x,y,"Instances",ob_orb,
					{
						path : path,
						pathnr : pathnr,
						pos : pos,
						index : index,
						colour : colour
					});
					
					global.matching[4] = 1;
					ob_control.alarm[4] = 1;
					instance_destroy();
				}
				
			}
			else
			{
				//If it is a rolling orb, move
				
				//Knockback
				if knockback > 0
				{
					global.match_pos = pos;
					i = index+1;
					while i < ds_list_size(global.ds_id4)
					{
						j = ds_list_find_value(global.ds_id4,i);
						if j.object_index != ob_orbshot and j.pos >= global.match_pos - 34/length
						{
							global.match_pos = j.pos;
							j.pos -= knockback/length;
							i += 1;
							if j.object_index = ob_pusher and j.spd > 0
							j.spd = 0;
						}
						else
						break;
					}
					pos -= knockback/length;
					knockback -= global.push_accel;
					if knockback < 0
					knockback = 0
					
				}
				
				//Reverse
				if (index < ds_list_size(global.ds_id4) - 1 and pos > ds_list_find_value(global.ds_pos4,index+1) + (34/length)
				and (colour == ds_list_find_value(global.ds_col4,index+1) or ds_list_find_value(global.ds_col4,index+1) = 0
				or ds_list_find_value(global.ds_col4,index+1) = 11 or colour == 11)) or reverse != 0
				{
					reverse += global.push_accel;
					i = index-1;
					global.match_pos = pos;
					while i > -1
					{
						j = ds_list_find_value(global.ds_id4,i);
						if j.object_index != ob_orbshot and j.pos <= global.match_pos+40/length
						{
							global.match_pos = j.pos 
							j.pos -= reverse/length;
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
				k = ds_list_find_value(global.ds_id4, index+1);
				if index < ds_list_size(global.ds_pos4) - 1 and pos < ds_list_find_value(global.ds_pos4,index+1) + (32/length)
				{
					pos = ds_list_find_value(global.ds_pos4,index+1) + (32/length);
					if reverse != 0 
					{
						//Knockback
						k = ds_list_find_value(global.ds_id4, index+1);
						if k.object_index = ob_orb
						{
							match_knockback = reverse*1.5;
							alarm[0] = 1;
							//global.matching[1] = 1;
							
						}
						j = ds_list_find_value(global.ds_id4, ds_list_size(global.ds_id4)-1);
						if j.pos - (knockback/length) >= pos-(33/length*(j.index-index)) and j.spd > 0
						{
							j.spd = 0;
						}
						reverse = 0;
					}
				}
				ds_list_replace(global.ds_pos4,index,pos);
				path_position = pos;
			}
		}
	}
	i -= 1;
}

//Fifth path
i = ds_list_size(global.ds_pos5)-2;
while(i>-1)
{
	if global.matching[5] = 1
	break;
	if instance_exists(ds_list_find_value(global.ds_id5,i))
	{
		with(ds_list_find_value(global.ds_id5,i))
		{
			index = ds_list_find_index(global.ds_id5,id);
			if object_index = ob_orbshot
			{
				//If it is a shot orb
				if counter > 0
				{
					//If it's still matching
					counter -= 3.2
					temp_pos -= 3.2/length
					other_pos = ds_list_find_value(global.ds_pos5,index+1);
					if temp_pos < other_pos
					temp_pos = other_pos;
					pos = temp_pos + (32-counter)/length
					ds_list_replace(global.ds_pos5, index, pos);
				
					xpos = path_get_x(path, pos);
					ypos = path_get_y(path, pos);
				
					x = xpos + lengthdir_x(match_length*counter/32, match_dir);
					y = ypos + lengthdir_y(match_length*counter/32, match_dir);
				}
				else
				{
					//If it's on the path, create a real orb
					ds_list_delete(global.ds_id5,index);
					ds_list_delete(global.ds_pos5,index);
					ds_list_delete(global.ds_col5,index);
					
					instance_create_layer(x,y,"Instances",ob_orb,
					{
						path : path,
						pathnr : pathnr,
						pos : pos,
						index : index,
						colour : colour
					});
					
					global.matching[5] = 1;
					ob_control.alarm[6] = 1;
					instance_destroy();
				}
				
			}
			else
			{
				//If it is a rolling orb, move
				
				//Knockback
				if knockback > 0
				{
					global.match_pos = pos;
					i = index+1;
					while i < ds_list_size(global.ds_id5)
					{
						j = ds_list_find_value(global.ds_id5,i);
						if instance_exists(j) and j.object_index != ob_orbshot and j.pos >= global.match_pos - 34/length
						{
							global.match_pos = j.pos;
							j.pos -= knockback/length;
							i += 1;
							if j.object_index = ob_pusher and j.spd > 0
							j.spd = 0;
						}
						else
						break;
					}
					pos -= knockback/length;
					knockback -= global.push_accel;
					if knockback < 0
					knockback = 0
					
				}
				
				//Reverse
				if (index < ds_list_size(global.ds_id5) - 1 and pos > ds_list_find_value(global.ds_pos5,index+1) + (34/length)
				and (colour == ds_list_find_value(global.ds_col5,index+1) or ds_list_find_value(global.ds_col5,index+1) = 0
				or ds_list_find_value(global.ds_col5,index+1) = 11 or colour == 11)) or reverse != 0
				{
					reverse += global.push_accel;
					i = index-1;
					global.match_pos = pos;
					while i > -1
					{
						j = ds_list_find_value(global.ds_id5,i);
						if instance_exists(j) and j.object_index != ob_orbshot and j.pos <= global.match_pos+40/length
						{
							global.match_pos = j.pos 
							j.pos -= reverse/length;
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
				k = ds_list_find_value(global.ds_id5, index+1);
				if index < ds_list_size(global.ds_pos5) - 1 and pos < ds_list_find_value(global.ds_pos5,index+1) + (32/length)
				{
					pos = ds_list_find_value(global.ds_pos5,index+1) + (32/length);
					if reverse != 0 
					{
						//Knockback
						k = ds_list_find_value(global.ds_id5, index+1);
						if instance_exists(k) and k.object_index = ob_orb
						{
							match_knockback = reverse*1.5;
							alarm[0] = 1;
							//global.matching[1] = 1;
							
						}
						j = ds_list_find_value(global.ds_id5, ds_list_size(global.ds_id5)-1);
						if j.pos - (knockback/length) >= pos-(33/length*(j.index-index)) and j.spd > 0
						{
							j.spd = 0;
						}
						reverse = 0;
					}
				}
				ds_list_replace(global.ds_pos5,index,pos);
				path_position = pos;
			}
		}
	}
	i -= 1;
}
