/// @description Insert description here
// You can write your code in this editor

//Reduce segment cooldown if there is free space
if array_length(global.ls_orbs[pathnr]) > 0 and cooldown > 0 
and global.ls_orbs[pathnr,array_length(global.ls_orbs[pathnr])-1].pos > 32/length
cooldown --;

//Spawn orbs
if global.level_progress < global.target and global.game
and (array_length(global.ls_orbs[pathnr]) == 0 
or (cooldown == 0 and global.ls_orbs[pathnr,array_length(global.ls_orbs[pathnr])-1].pos > 32/length))
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