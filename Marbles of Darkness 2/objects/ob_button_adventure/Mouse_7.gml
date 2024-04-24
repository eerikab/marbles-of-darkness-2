/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and image_alpha = 1
{
	global.gamemode = 1;
	sc_load();
	
	if global.adv_points == 0 and global.check_adv == 0
	{
		i = 1
		while i <= 5
		{
			if i <= global.dif_mode_num
			{
				a = instance_create_depth(x-208,global.rm_height/2-96+i*32,depth,ob_adventure_difficulty);
				a.i = i;
			}
			if i <= global.length_num
			{
				a = instance_create_depth(x+112,global.rm_height/2-96+i*32,depth,ob_adventure_length);
				a.i = i;
			}
			i += 1;
		}
		instance_create_depth(x,global.rm_height/2+144,depth,ob_button_adv_start);
		global.dif_user = global.dif_default;
		global.adv_length = global.len_default;
	}
	else
	{
		instance_create_depth(x,global.rm_height/2+96,depth,ob_button_load);
		instance_create_depth(x,global.rm_height/2+144,depth,ob_button_newgame);
	}
	instance_destroy(ob_button_practice);
	instance_destroy(ob_button_endless);
	instance_destroy();
	
	//a = instance_create_depth(x,y,0,ob_transition);
	//a.nextroom = rm_map;
}