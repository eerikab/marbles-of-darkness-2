/// @description Insert description here
// You can write your code in this editor

//Activate powerups
object = instance_create_depth(x,y-32,0,ob_scoring);
object.blend = 0;
object.point_get = global.txt_powerup[image_index];
switch(image_index)
{
	//Electric beam
	case 1: global.specialorb = 12;
		audio_play_sound(global.sou_power_electric,0,0);
		break;
	//Reverse
	case 2: with ob_pusher
		power_reverse = global.cool_reverse*60;
		audio_play_sound(global.sou_power_reverse,0,0);
		break;
	//Stop
	case 3: with ob_pusher
		stop = global.cool_stop*60;
		audio_play_sound(global.sou_power_stop,0,0);
		break;
	//Fireball
	case 4: global.specialorb = 13;
		audio_play_sound(global.sou_power_fireball,0,0);
		break;
	//Wild Orb
	case 5: global.specialorb = 11;
		audio_play_sound(global.sou_power_wild,0,0);
		break;
	//Accuracy
	case 6: global.accuracy = 60*global.cool_accuracy;
		audio_play_sound(global.sou_power_accuracy,0,0);
		break;
	//Slow
	case 7: with ob_pusher
		slow = global.cool_slow*60;
		audio_play_sound(global.sou_power_slow,0,0);
		break;
	//Colour cloud
	case 8: global.specialorb = 15;
		audio_play_sound(global.sou_power_colourcloud,0,0);
		break;
	//Anti-Orbs
	case 9: instance_create_depth(x,y,-50,ob_antiorb_spawner,{pathnr:1});
		if global.paths > 1
		instance_create_depth(x,y,-50,ob_antiorb_spawner,{pathnr:2}) 
		if global.paths > 2
		instance_create_depth(x,y,-50,ob_antiorb_spawner,{pathnr:3})
		if global.paths > 3
		instance_create_depth(x,y,-50,ob_antiorb_spawner,{pathnr:4})
		if global.paths > 4
		instance_create_depth(x,y,-50,ob_antiorb_spawner,{pathnr:5})
		audio_play_sound(global.sou_power_antiorb,0,0);
		break;
	//Precise Shot
	case 10: global.precise = global.cool_precise*60;
		audio_play_sound(global.sou_power_precise,0,0);
		break;
	//Darts
	case 11: global.bullets = 5;
		audio_play_sound(global.sou_power_bullet,0,0);
		break;
	//Triple Shot
	case 12: global.specialorb = 17;
		audio_play_sound(global.sou_power_triple,0,0);
		break;
	//Colour bomb
	case 13: global.specialorb = 14;
		audio_play_sound(global.sou_power_colourbomb,0,0);
		break;
	//Whitener
	case 14: global.specialorb = 18;
		audio_play_sound(global.sou_power_white,0,0);
		break;
	//Inferno
	case 15: instance_create_depth(x,y,0,ob_inferno);
		audio_play_sound(global.sou_power_inferno,0,0);
		break;
	//Poinson
	case 16: global.specialorb = 19;
		audio_play_sound(global.sou_power_poison,0,0);
		break;
	//Group
	case 17: 
		index = 1
		while index < ds_list_size(global.ds_id1)
		{
			orb = ds_list_find_value(global.ds_id1,index);
			
			if orb.object_index = ob_orb
			{
				with orb
				{
					var frontorb = ds_list_find_value(global.ds_id1,index-1);
					var backorb = ds_list_find_value(global.ds_id1,index+1);
					
					if frontorb.object_index = ob_orb
					{
						if colour != frontorb.colour and (backorb.object_index != ob_orb or backorb.colour != colour)
						colour = frontorb.colour;
						ds_list_replace(global.ds_col1,index,colour);
					}
				}
			}
			index += 1;
		}
		
		index = 1
		while index < ds_list_size(global.ds_id2)
		{
			orb = ds_list_find_value(global.ds_id2,index);
			
			if orb.object_index = ob_orb
			{
				with orb
				{
					var frontorb = ds_list_find_value(global.ds_id2,index-1);
					var backorb = ds_list_find_value(global.ds_id2,index+1);
					
					if frontorb.object_index = ob_orb
					{
						if colour != frontorb.colour and (backorb.object_index != ob_orb or backorb.colour != colour)
						colour = frontorb.colour;
						ds_list_replace(global.ds_col2,index,colour);
					}
				}
			}
			index += 1;
		}
		
		index = 1
		while index < ds_list_size(global.ds_id3)
		{
			orb = ds_list_find_value(global.ds_id3,index);
			
			if orb.object_index = ob_orb
			{
				with orb
				{
					var frontorb = ds_list_find_value(global.ds_id3,index-1);
					var backorb = ds_list_find_value(global.ds_id3,index+1);
					
					if frontorb.object_index = ob_orb
					{
						if colour != frontorb.colour and (backorb.object_index != ob_orb or backorb.colour != colour)
						colour = frontorb.colour;
						ds_list_replace(global.ds_col3,index,colour);
					}
				}
			}
			index += 1;
		}
		
		index = 1
		while index < ds_list_size(global.ds_id4)
		{
			orb = ds_list_find_value(global.ds_id4,index);
			
			if orb.object_index = ob_orb
			{
				with orb
				{
					var frontorb = ds_list_find_value(global.ds_id4,index-1);
					var backorb = ds_list_find_value(global.ds_id4,index+1);
					
					if frontorb.object_index = ob_orb
					{
						if colour != frontorb.colour and (backorb.object_index != ob_orb or backorb.colour != colour)
						colour = frontorb.colour;
						ds_list_replace(global.ds_col4,index,colour);
					}
				}
			}
			index += 1;
		}
		
		index = 1
		while index < ds_list_size(global.ds_id5)
		{
			orb = ds_list_find_value(global.ds_id5,index);
			
			if orb.object_index = ob_orb
			{
				with orb
				{
					var frontorb = ds_list_find_value(global.ds_id5,index-1);
					var backorb = ds_list_find_value(global.ds_id5,index+1);
					
					if frontorb.object_index = ob_orb
					{
						if colour != frontorb.colour and (backorb.object_index != ob_orb or backorb.colour != colour)
						colour = frontorb.colour;
						ds_list_replace(global.ds_col5,index,colour);
					}
				}
			}
			index += 1;
		}
		
		audio_play_sound(global.sou_power_group,0,0);
		break;
	
	//Blocker
	case 18: 
		index = 0
		with(ob_blocker)
		{
			if pathnr == 1
			other.index = 1;
		}
		if index = 1
		{
			with(ob_blocker)
			{
				if pathnr == 1
				life = max_life;
			}
		}
		else
		instance_create_depth(x,y,-50,ob_blocker,{pathnr : 1});
		
		if global.paths > 1
		{
			index = 0
			with(ob_blocker)
			{
				if pathnr == 2
				other.index = 1;
			}
			if index = 1
			{
				with(ob_blocker)
				{
					if pathnr == 2
					life = max_life;
				}
			}
			else
			instance_create_depth(x,y,-50,ob_blocker,{pathnr : 2});
		}
		
		if global.paths > 2
		{
			index = 0
			with(ob_blocker)
			{
				if pathnr == 3
				other.index = 1;
			}
			if index = 1
			{
				with(ob_blocker)
				{
					if pathnr == 3
					life = max_life;
				}
			}
			else
			instance_create_depth(x,y,-50,ob_blocker,{pathnr : 3});
		}
		
		if global.paths > 3
		{
			index = 0
			with(ob_blocker)
			{
				if pathnr == 4
				other.index = 1;
			}
			if index = 1
			{
				with(ob_blocker)
				{
					if pathnr == 4
					life = max_life;
				}
			}
			else
			instance_create_depth(x,y,-50,ob_blocker,{pathnr : 4});
		}
		
		if global.paths > 4
		{
			index = 0
			with(ob_blocker)
			{
				if pathnr == 5
				other.index = 1;
			}
			if index = 1
			{
				with(ob_blocker)
				{
					if pathnr == 5
					life = max_life;
				}
			}
			else
			instance_create_depth(x,y,-50,ob_blocker,{pathnr : 5});
		}
		
		audio_play_sound(global.sou_power_blocker,0,0);
		break;	
}

global.powerups += 1;
global.stat_power += 1;
instance_destroy();