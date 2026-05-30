// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_adv_options(){
	///Spawn the options for a new adventure game
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
	global.dif_user = clamp(global.dif_default, 1, global.difficulty_num);
	global.adv_length = clamp(global.len_default, 1, global.length_num);
	instance_destroy();
}