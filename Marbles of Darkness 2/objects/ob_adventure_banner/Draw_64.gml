/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_text(x,y-18,global.txt_stage + string(global.adv_stage))
draw_text(x,y+18,string(global.adv_level) + " - " 
+ global.title[global.lvl_adv[global.adv_stage,global.adv_level]]);