/// @description Movement
// You can write your code in this editor

if global.level_progress >= global.dif_orbs[global.difficulty] 
and !instance_exists(ob_orb) and global.lost == 0 and i == 0
{
	//Wait until all orbs are cleared
	i = 1;
	alarm[0] = 60;
}

if activated
{
	//Movement and particles
	path_position -= 32/length;
	x = path_get_x(path,path_position);
	y = path_get_y(path,path_position);

	if path_get_speed(path,path_position) > 50
	{
		depth = -50;
		effect_create_above(ef_flare,x,y,2,c_blue);
		effect_create_above(ef_flare,x,y,1,c_yellow);
	}
	else
	{
		depth = 50;
		effect_create_below(ef_flare,x,y,2,c_blue);
		effect_create_below(ef_flare,x,y,1,c_yellow);
	}

	if path_position = 0 or path_position < pos
	{
		//Give bonus, end the level
		sc_score(points,x,y,0,0,0);
		if instance_number(object_index) == 1
		instance_create_depth(x,y,-75,ob_level_stats);
		instance_destroy();
	}
}