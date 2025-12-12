/// @description Set up intro
// You can write your code in this editor

alpha1 = 1; //Black cover
alpha2 = 0; //Level text
alpha3 = 0.75; //Textbox
alarm[0] = 120;
alarm[3] = 60;
gain = 1;
x = global.rm_width;
y = global.rm_height-128;
alarm[4] = 1;
start = 0;
skip = 0;

global.lvl_music = 1;
global.music_nr += 1;
if global.music_nr > global.mus_game_num
global.music_nr = 1;
global.lvl_music = global.mus_game[global.music_nr];