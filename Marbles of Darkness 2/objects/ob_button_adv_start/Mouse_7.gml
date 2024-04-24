/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and image_alpha = 1
{
	global.adv_level = 1;
	global.adv_stage = 1;
	global.adv_lives = 3;
	global.adv_points = 0;
	global.adv_live_score = 0;
	sc_adv_setup(1);
	a = instance_create_depth(x,y,0,ob_transition);
	a.nextroom = rm_map;
}
