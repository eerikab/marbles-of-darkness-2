/// @description Level setup
// You can write your code in this editor

//Difficulty settings

global.level_progress = 0;

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
global.paths = global.level_paths[global.selected];
//Orb array orbs[path,index] = ID
global.ls_orbs = [];
global.matching = [];

for (i = 1; i <= global.paths; i++)
{
	global.ls_orbs[i] = [];
	global.matching[i] = 0;
	
	global.path[i] = global.level_path[global.selected,i];
	instance_create_layer(640,360,"Instances",ob_spawner, {pathnr : i});
}
global.onehole = global.level_onehole[global.selected];
global.txt_end_bonus = 0;

randomize();

instance_create_depth(x,y,-10,ob_shooter);
instance_create_depth(x,y,-100,ob_hud);
instance_create_depth(x,y,-20,ob_intro);
global.chain = 0;

global.game = 1;
global.lost = 0;

alarm[0] = 1;
alarm[1] = 60;

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