/// @description Level texbox
// You can write your code in this editor

draw_set_color(c_black);
draw_set_alpha(alpha3);
draw_set_font(global.font_large)

if global.gamemode == 1
txt = global.txt_lvl_adv + string(global.adv_stage) + "-" + string(global.adv_level) 
	+ "\n" + global.title[global.selected];
else if global.gamemode == 2
txt = global.txt_level + string(global.difficulty) + "\n" + global.title[global.selected];
else
txt = global.txt_mode[3] + "\n" + global.title[global.selected];
height = string_height(txt);
draw_rectangle(x,y-height/2-8,room_width,y+height/2+8,false);

draw_set_alpha(alpha2);
draw_set_color(c_white);
if global.colortext
draw_set_colour(c_yellow);
draw_text(room_width/2,y,txt);
draw_set_font(global.font_small);
draw_set_color(c_white);
draw_set_alpha(1);