/// @description Reset view
// You can write your code in this editor

instance_destroy(ob_adventure_dot);
instance_destroy(ob_adventure_light);
i = 0;
j = 0;
repeat(global.stages)
{
	i += 1;
	j += 1;
	k = 0;
	x = path_get_point_x(global.path_map,i-1);
	y = path_get_point_y(global.path_map,i-1);
	a = instance_create_depth(x,y,depth,ob_adventure_dot);
	a.sprite_index = global.sprite_asterisk;
	a.stage = j;
	repeat(global.lvl_stage[j])
	{
		i += 1;
		k += 1;
		x = path_get_point_x(global.path_map,i-1);
		y = path_get_point_y(global.path_map,i-1);
		if j < global.adv_stage or (j == global.adv_stage and k <= global.adv_level)
		instance_create_depth(x,y,depth,ob_adventure_dot);
		if j == global.adv_stage and k == global.adv_level
		instance_create_depth(x,y,depth-5,ob_adventure_light);
	}
}