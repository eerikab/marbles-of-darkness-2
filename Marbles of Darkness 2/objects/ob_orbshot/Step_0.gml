/// @description Movement
// You can write your code in this editor

//Shoot if mouse pressed
if mouse_check_button_pressed(mb_left) and shot = false and visible and ob_button_menu.image_index == 0
and (!instance_exists(ob_pad2) or ob_pad2.image_index == 0)
{
	shot = true;
	alarm[0] = 10;
	global.orbs_shot += 1;
	global.stat_shot += 1;
	audio_play_sound(global.sou_shoot,0,0);
	ob_shooter.dir = 2;
	ob_shooter.alarm[0] = 1;
	if colour = 12
	{
		var points = 0;
		beam = instance_create_depth(x,y,depth,ob_electric_beam);
		beam.image_angle = image_angle;
		audio_play_sound(global.sou_power_electric_blast,0,0);
		with(ob_orb)
		{
			if place_meeting(x,y,ob_electric_beam)
			{
				points += 100;
				global.level_progress += 1;
				instance_destroy();
			}
		}
		sc_score(points,x,y,9,0,0);
		instance_destroy();
		exit;
	}
	if global.precise > 0
	{
		effect_create_above(ef_spark,x,y,0,c_white);
		x = mouse_x;
		y = mouse_y;
		effect_create_above(ef_spark,x,y,0,c_white);
	}
	if colour = 17
	{
		//Duplicate itself
		orb = instance_create_depth(x,y,depth,ob_orbshot);
		orb.image_angle = image_angle - 20;
		orb.shot = 1;
		orb.colour = colour;
		orb.create_orb = 0;
		orb.visible = 1;
		
		orb = instance_create_depth(x,y,depth,ob_orbshot);
		orb.image_angle = image_angle + 20;
		orb.shot = 1;
		orb.colour = colour;
		orb.create_orb = 0;
		orb.visible = 1;
	}
}

//Standby
if !shot
{
	//Move to shooter
	if ob_shooter.mode == 1
	{
		x = ob_shooter.x;
		y = ob_shooter.y-global.shooter_offset;
	}
	else
	{
		x = ob_shooter.x;
		y = ob_shooter.y;
		image_angle = ob_shooter.image_angle;
		x += lengthdir_x(global.pad_offset, image_angle);
		y += lengthdir_y(global.pad_offset, image_angle);
	}
	
	if global.bullets > 0 and colour != 16
	{
		global.bullets -= 1
		colour = 16
	}
	if global.specialorb != 0
	{
		colour = global.specialorb;
		global.specialorb = 0;
	}
	
	//Check if there's an orb with the same colour
	if (!sc_check_colour(colour) or colour == 0) 
	and (colour < 11 or colour > 19) and instance_exists(ob_orb)
	{
		while (!sc_check_colour(colour) 
		or colour = 0 or (colour > 10 and colour < 20))
		and instance_exists(ob_orb)
		colour = irandom_range(1,global.dif_col[global.difficulty]);
	}
	
	//Orb swap
	if mouse_check_button_pressed(mb_right) and colour > 0 and colour != 16
	{
		var temp = colour;
		colour = ob_shooter.colour;
		ob_shooter.colour = temp;
		audio_play_sound(global.sou_swap,0,0);
	}
	
	if global.game = 0
	{
	instance_destroy(self,false);
	exit;
	}
	
	if !instance_exists(ob_orb) or colour = 0
	visible = 0;
	else
	visible = 1;
}
else
{
	if matching = false
	{
		//Movement
		if moving == 1
		{
			if global.accuracy > 0
			{
				x += lengthdir_x(global.acc_speed,image_angle);
				y += lengthdir_y(global.acc_speed,image_angle);
			}
			else
			{
				x += lengthdir_x(global.shotspeed,image_angle);
				y += lengthdir_y(global.shotspeed,image_angle);
			}
		}
		
		if y <= -16 or y >= room_height+16
		or x <= -16 or x >= room_width+16
		{
			//Remove if out of screen
			if colour != 17
			{
				global.shots_missed += 1;
				global.chain = 0;
			}
			
			instance_destroy();
		}
		
		//Touching powerup
		pow = 0;
		dist = 0;
		if (colour < 11 or colour > 19)
		{
			with(ob_powerup)
			{
				var pd = point_distance(x,y,other.x,other.y);
				if !drop and pd <= 32 and (other.pow == 0 or pd < other.dist)
				{
					other.pow = self;
					other.dist = pd;
				}
			}
		}
	
		//Touching with orb
		orb = 0;
		dist = 0;
		if (colour < 12 or colour > 19)
		{
			with(ob_pusher)
			{
				var pd = point_distance(x,y,other.x,other.y);
				if shootable and pos > 0 and pd <= 32 and (other.orb == 0 or pd < other.dist)
				{
					other.orb = self;
					other.dist = pd;
				}
			}
		}
		with(ob_orb)
		{
			var pd = point_distance(x,y,other.x,other.y);
			if shootable and pos > 0 and pd <= 32 and (other.orb == 0 or pd < other.dist)
			{
				other.orb = self;
				other.dist = pd;
			}
		}
		
		//Interact with the nearest
		if pow != 0 and (orb == 0 or point_distance(x,y,pow.x,pow.y) < point_distance(x,y,orb.x,orb.y))
		{
			//Powerup
			with(pow)
			{
				alarm[0] = 1;
			}
			instance_destroy();
		}
		else if orb != 0
		{
			var points = 0;
			//Orb
			if colour == 12 //Electric beam
			{
				instance_destroy();
			}
			else if colour == 13 //Fireball
			{
				with(ob_orb)
				{
					if point_distance(x,y,other.x,other.y) < 160
					{
						points += 100;
						global.level_progress += 1;
						instance_destroy();
					}
				}
				sc_score(points,x,y,8,0,0);
				audio_play_sound(global.sou_power_fireball_blast,0,0);
				effect_create_above(ef_explosion,x,y,2,make_color_rgb(255,128,0));
				instance_destroy();
				exit;
			}
			else if colour == 14 //Colour bomb
			{
				global.match_colour = orb.colour;
				with(ob_orb)
				{
					if colour == global.match_colour
					{
						points += 100;
						global.level_progress += 1;
						effect_create_above(ef_explosion,x,y,0, global.color[colour]);
						instance_destroy();
					}
				}
				sc_score(points,x,y,global.match_colour,0,0);
				audio_play_sound(global.sou_power_colourbomb_blast,0,0);
				instance_destroy();
				exit;
			}
			else if colour == 15 //Colour cloud
			{
				global.match_colour = orb.colour;
				with(ob_orb)
				{
					if point_distance(x,y,other.x,other.y) < 160
					{
						colour = global.match_colour;
					}
				}
				effect_create_above(ef_explosion,x,y,2,global.color[global.match_colour]);
				audio_play_sound(global.sou_power_colourcloud_blast,0,0);
				instance_destroy();
				exit;
			}
			else if colour == 16 //Dart
			{
				
				score += 100;
				global.level_progress += 1;
				instance_destroy(orb);
					
				instance_destroy();
				exit;
			}
			else if colour == 17 //Triple shot
			{
				score += 100;
				global.level_progress += 1;
				instance_destroy(orb);
			}
			else if colour == 18 //Whitener
			{
				global.match_colour = orb.colour;
				with(ob_orb)
				{
					if colour == global.match_colour
					{
						colour = 7;
						effect_create_above(ef_explosion,x,y,0, global.color[colour]);
					}
				}
				audio_play_sound(global.sou_power_white_blast,0,0);
				instance_destroy();
				exit;
			}
			else if colour == 19 //Poison
			{
				orb.alarm[3] = 1;
				orb.poison = 7;
				orb.poison_dir = 0;
				audio_play_sound(global.sou_power_poison_blast,0,0);
				instance_destroy();
				exit;
			}
			else //Regular orb
			{
			
				matching = true;
				pathnr = orb.pathnr;
				path = orb.path;
				pos = orb.pos;
				length = path_get_length(path);
				audio_play_sound(global.sou_orb_hit,0,0);
			
				if orb.object_index == ob_pusher
				{
					//Go in front of the pusher
					index = orb.index;
					temp_pos = orb.pos;
					xpos = path_get_x(path, orb.pos);
					ypos = path_get_y(path, orb.pos);
				}
				else
				{
					//Go between the nearest orbs
					if point_distance(x,y,path_get_x(path,pos+(32/orb.length)),
						path_get_y(path,pos+(32/orb.length))) <
					point_distance(x,y,path_get_x(path,pos-(32/orb.length)),
						path_get_y(path,pos-(32/orb.length)))
					{
						index = orb.index;
						temp_pos = orb.pos;
						xpos = path_get_x(path, orb.pos);
						ypos = path_get_y(path, orb.pos);
					}
					else
					{
						index = orb.index + 1;
						temp_pos = orb.pos - 32/length;
						xpos = path_get_x(path, orb.pos - 32/orb.length);
						ypos = path_get_y(path, orb.pos - 32/orb.length);
					}
				}
			
				length = path_get_length(path);
				counter = 32;
				match_length = point_distance(x,y,xpos,ypos);
				match_dir = point_direction(xpos,ypos,x,y);
				//Insert orb to orbs list
				array_insert(global.ls_orbs[pathnr],index,id);
				pos = temp_pos;
			}
		}
		
		moving = 1;
	}
	else
	{
		//If not found on orbs list, remove itself
		if (array_get_index(global.ls_orbs[pathnr],id) == -1)
		{
			matching = 0;
			instance_destroy();
		}
	}
}