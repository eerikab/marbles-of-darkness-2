/// @description Level setup
// You can write your code in this editor

//Difficulty settings

global.level_progress = 0;
global.matching[1] = 0;
global.matching[2] = 0;
global.matching[3] = 0;
global.matching[4] = 0;
global.matching[5] = 0;
if global.gamemode == 1
global.hardness = global.dif_mode[global.dif_user];
else
global.hardness = global.dif_free;

global.slow = 0;
global.stop = 0;
global.reverse = 0;
global.precise = 0;
global.accuracy = 0;

global.target = global.dif_target[global.difficulty]*global.hardness;

//Defining variables
global.ds_pos1 = ds_list_create();
global.ds_col1 = ds_list_create();
global.ds_id1 = ds_list_create();

global.ds_pos2 = ds_list_create();
global.ds_col2 = ds_list_create();
global.ds_id2 = ds_list_create();

global.ds_pos3 = ds_list_create();
global.ds_col3 = ds_list_create();
global.ds_id3 = ds_list_create();

global.ds_pos4 = ds_list_create();
global.ds_col4 = ds_list_create();
global.ds_id4 = ds_list_create();

global.ds_pos5 = ds_list_create();
global.ds_col5 = ds_list_create();
global.ds_id5 = ds_list_create();

randomize();

instance_create_depth(x,y,-5,ob_shooter);
instance_create_depth(x,y,-100,ob_hud);
instance_create_depth(x,y,-20,ob_intro);
global.chain = 0;

alarm[1] = 1;

global.game = 1;
global.lost = 0;

alarm[5] = 60;

score = 0;
if global.gamemode == 1
{
	score = global.adv_points;
	lives = global.adv_lives;
}
global.start_score = score;

global.orbs_shot = 0;
global.combo_high = 0;
global.chain_high = 0;
global.segments = 0;
global.powerups = 0;
global.bonus_total = 0;
global.bullets = 0;
global.specialorb = 0;
global.endless_dif = 1;
global.warning = 0;
global.level_time = 0;
global.shots_missed = 0;

global.end_bonus[1] = 0;
global.end_bonus[2] = 0;
global.end_bonus[3] = 0;
global.end_bonus[4] = 0;
global.end_bonus[5] = 0;