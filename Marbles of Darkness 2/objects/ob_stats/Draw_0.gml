/// @description Insert description here
// You can write your code in this editor

draw_set_font(global.font_large);
draw_text(global.rm_width/2,48,global.txt_stat_title);
draw_set_font(global.font_small);

//Time formatting
mins = floor((global.stat_time / 60) mod 60);
if mins < 10
mins = "0" + string(mins);
else
mins = string(mins);
hours = floor(global.stat_time / 3600);
hours = string(hours);

//Put together stat text
txt1 = global.txt_stat[1] + string(global.stat_shot);
txt1 += "\n\n" + global.txt_stat[2] + string(global.stat_clear);
txt1 += "\n\n" + global.txt_stat[3] + string(global.stat_combo);
txt1 += "\n\n" + global.txt_stat[4] + string(global.stat_chain);
txt1 += "\n\n" + global.txt_stat[5] + string(global.stat_power);
txt1 += "\n\n" + global.txt_stat[6] + string(global.stat_wins);
txt1 += "\n\n" + global.txt_stat[7] + hours+":"+mins;

draw_text(global.rm_width/4,global.rm_height/2,txt1);

//Put together high score text
txt2 = global.txt_highscore;
for (i = 1; i <= 5; i++)
txt2 += "\n\n" + string(global.highscore[i]);
draw_text(global.rm_width*3/4,global.rm_height/2,txt2);