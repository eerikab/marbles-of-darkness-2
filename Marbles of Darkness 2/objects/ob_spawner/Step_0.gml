/// @description Insert description here
// You can write your code in this editor

//Reduce segment cooldown if there is free space
if ((pathnr == 1 and ds_list_find_value(global.ds_pos1,ds_list_size(global.ds_pos1) - 1) > 32/length)
or (pathnr == 2 and ds_list_find_value(global.ds_pos2,ds_list_size(global.ds_pos2) - 1) > 32/length)
or (pathnr == 3 and ds_list_find_value(global.ds_pos3,ds_list_size(global.ds_pos3) - 1) > 32/length)
or (pathnr == 4 and ds_list_find_value(global.ds_pos4,ds_list_size(global.ds_pos4) - 1) > 32/length)
or (pathnr == 5 and ds_list_find_value(global.ds_pos5,ds_list_size(global.ds_pos5) - 1) > 32/length)) 
and cooldown > 0
cooldown --;

//Spawn orbs
if global.level_progress < global.target and global.game
{
	if ((pathnr == 1 and (ds_list_size(global.ds_id1) == 0 or (ds_list_find_value(global.ds_pos1,ds_list_size(global.ds_pos1) - 1) > 32/length and cooldown = 0)))
	or (pathnr == 2 and (ds_list_size(global.ds_id2) == 0 or (ds_list_find_value(global.ds_pos2,ds_list_size(global.ds_pos2) - 1) > 32/length and cooldown = 0)))
	or (pathnr == 3 and (ds_list_size(global.ds_id3) == 0 or (ds_list_find_value(global.ds_pos3,ds_list_size(global.ds_pos3) - 1) > 32/length and cooldown = 0)))
	or (pathnr == 4 and (ds_list_size(global.ds_id4) == 0 or (ds_list_find_value(global.ds_pos4,ds_list_size(global.ds_pos4) - 1) > 32/length and cooldown = 0)))
	or (pathnr == 5 and (ds_list_size(global.ds_id5) == 0 or (ds_list_find_value(global.ds_pos5,ds_list_size(global.ds_pos5) - 1) > 32/length and cooldown = 0))))
	{
		global.segments += 1;
		i = 0;
		repeat(global.dif_orbs[global.difficulty] * global.path_multi * global.hardness)
		{
			instance_create_layer(x,y,"Instances",ob_orb,
			{
				path : path,
				pathnr : pathnr,
				pos : i,
				index : -1
			});
			i -= 32/length;
		}
		instance_create_layer(x,y,"Instances",ob_pusher,
		{
			path : path,
			pathnr : pathnr,
			pos : i
		});
		cooldown = global.dif_cooldown[global.difficulty] * game_get_speed(gamespeed_fps);
		audio_play_sound(global.sou_rolling,0,0);
	}
}