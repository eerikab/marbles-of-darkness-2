/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and image_alpha = 1
{
	a = instance_create_depth(x,y,0,ob_transition);
	if global.skip_instruct or global.instruct_shown
	a.nextroom = rm_game;
	else
	{
		global.instruct_shown = 1;
		a.nextroom = rm_instructions;
	}
	global.nextroom = rm_game;
	

	if global.gamemode == 1
	{
		global.selected = global.lvl_adv[global.adv_stage,global.adv_level];
		
		if !global.unlocked[global.selected]
		{
			global.unlocked[global.selected] = 1;
			ini_open(global.savefile + "save.ini");
			ini_write_real("Unlocked",string(global.selected),1);
			ini_close();
		}

		global.difficulty = global.stage_dif[global.adv_stage];
		if global.adv_points == 0 and global.first_start
		{
			ini_open(global.savefile + "save.ini");
			points = ini_read_real("Adventure","score",0);
			ini_close();
			sc_highscore(points);
		}
		sc_save();
	}
}