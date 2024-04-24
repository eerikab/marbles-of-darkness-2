/// @description Set view
// You can write your code in this editor

sc_window();
sc_background(global.back_map);
path = global.path_map;
i = 0;
j = 0;
global.view = 0;
global.view_end = global.rm_width;
dragging = 0;
repeat(global.stages)
{
	i += 1;
	j += 1;
	k = 0;
	if i <= path_get_number(global.path_map)
	{
		x = path_get_point_x(global.path_map,i-1);
		y = path_get_point_y(global.path_map,i-1);
	}
	a = instance_create_depth(x,y,depth,ob_adventure_dot);
	a.sprite_index = global.sprite_asterisk;
	a.stage = j;
	repeat(global.lvl_stage[j])
	{
		i += 1;
		k += 1;
		if i <= path_get_number(global.path_map)
		{
			x = path_get_point_x(global.path_map,i-1);
			y = path_get_point_y(global.path_map,i-1);
		}
		if j < global.adv_stage or (j == global.adv_stage and k <= global.adv_level)
		instance_create_depth(x,y,depth,ob_adventure_dot);
		if j == global.adv_stage and k == global.adv_level
		{
			instance_create_depth(x,y,depth-5,ob_adventure_light);
			global.view = x - global.rm_width + 256;
		}
		if x + 128 > global.view_end
		global.view_end = x + 128;
	}
	
}
i += 1;
if i <= path_get_number(global.path_map)
{
	x = path_get_point_x(global.path_map,i-1);
	y = path_get_point_y(global.path_map,i-1);
}
instance_create_depth(x,y,depth,ob_adventure_end);

room_width = sprite_get_width(global.back_map);
if room_width < global.rm_width
room_width = global.rm_width;

if x + 128 > global.view_end
global.view_end = x + 128;
global.view_end = clamp(global.view_end,global.rm_width,room_width);
global.view = clamp(global.view,0,global.view_end-global.rm_width);
if global.adv_level == 1 and global.adv_points > 0 and global.adv_stage > 1
instance_create_depth(global.rm_width/2,288,0,ob_stage_complete);
if global.adv_stage > global.stages
room_goto(rm_end);