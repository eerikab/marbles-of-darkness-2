/// @description Insert description here
// You can write your code in this editor

//Save stats, end level
sprite_index = global.sprite_board;
if global.gamemode == 1
{
	sc_highscore(score);
}
else if global.gamemode == 2
{
	ini_open(global.savefile + "save.ini");
	ini_write_real("In progress","practice",0);
	ini_close();
}
else if global.gamemode == 3
{
	ini_open(global.savefile + "save.ini");
	ini_write_real("In progress","endless",0);
	if score > global.endless_high[global.selected]
	{
		global.endless_high[global.selected] = score;
		ini_write_real("Endless","highscore"+string(global.selected),score);
	}
	ini_close();
}

//Variables
image_alpha = 0;
alarm[0] = 1;
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

if global.orbs_shot == 0
accuracy = 0;
else
accuracy = round((global.orbs_shot - global.shots_missed) 
	/ global.orbs_shot * 100);