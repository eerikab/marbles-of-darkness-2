/// @description Increase timer
// You can write your code in this editor

global.stat_time += 1;
if global.stat_time mod 60 == 0
sc_stat();
alarm[1] = 60;