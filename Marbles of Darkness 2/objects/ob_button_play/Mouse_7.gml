/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and !instance_exists(ob_board_par)
{
	sc_load();
	instance_create_depth(global.rm_width/2,global.rm_height/2,depth-25,ob_play_sign);
	if global.unlocked[global.lvl_adv[global.adv_stage,global.adv_level]] == 0
	{
		global.unlocked[global.lvl_adv[global.adv_stage,global.adv_level]] = 1;
		ini_open(global.savefile + "save.ini");
		ini_write_real("Unlocked",string(global.lvl_adv[global.adv_stage,global.adv_level]),1);
		ini_close();
	}
}
