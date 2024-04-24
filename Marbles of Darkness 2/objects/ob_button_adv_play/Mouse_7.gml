/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and image_alpha = 1
{
	if global.gamemode == 1
	{
		global.selected = global.lvl_adv[global.adv_stage,global.adv_level];
		a = instance_create_depth(x,y,0,ob_transition);
		a.nextroom = rm_game;
		global.difficulty = global.stage_dif[global.adv_stage];
		if global.adv_points == 0 and global.first_start
		{
			ini_open("save.ini");
			points = ini_read_real("Adventure","score",0);
			ini_close();
			sc_highscore(points);
		}
		sc_save();
	}
	else
	{
		a = instance_create_depth(x,y,0,ob_transition);
		a.nextroom = rm_game;
	}
}