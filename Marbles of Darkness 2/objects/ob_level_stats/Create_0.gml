/// @description Insert description here
// You can write your code in this editor

//Save stats, end level
sprite_index = global.sprite_board;
if global.gamemode == 1
{
	global.adv_level += 1;
	if global.adv_level > global.lvl_stage[global.adv_stage]
	{
		global.adv_level = 1;
		global.adv_stage += 1;
	}
	global.adv_points = score;
	if global.unlocked[global.selected] == 0
	{
		global.unlocked[global.selected] = 1;
		ini_open(global.savefile + "save.ini");
		ini_write_real("Unlocked",string(global.selected),1);
		ini_close();
	}
	sc_save();
}
else if global.gamemode == 2
{
	ini_open(global.savefile + "save.ini");
	ini_write_real("In progress","practice",0);
	if global.unlocked[global.selected] = global.difficulty
	{
		ini_write_real("Unlocked",string(global.selected),global.difficulty+1);
		global.unlocked[global.selected] = global.difficulty+1;
	}
	ini_close();
}
else if global.gamemode == 3
{
	ini_open(global.savefile + "save.ini");
	ini_write_real("In progress","endless",0);
	ini_close();
}

//Variables
image_alpha = 0;
alarm[0] = 60;
x = room_width/2;
y = room_height/2;
level_score = score - global.start_score;
display_score = 0;
score_count = 0;
stat_alpha = 0;
active = 0;

//Time formatting
var minutes = floor(global.level_time / 60);
var seconds = global.level_time mod 60;

if minutes < 10
minutes = "0" + string(minutes);
else
minutes = string(minutes);

if seconds < 10
seconds = "0" + string(seconds);
else
seconds = string(seconds);

display_time = minutes + ":" + seconds;

accuracy = round((global.orbs_shot - global.shots_missed) 
	/ global.orbs_shot * 100);