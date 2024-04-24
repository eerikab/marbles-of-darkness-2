/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(image_alpha / 2);
draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false);
draw_set_alpha(image_alpha);
draw_self();

draw_set_font(global.font_large);
draw_text(x,y-192,global.txt_lost);
draw_text(x,y-64,string(level_score));
draw_set_font(global.font_small);
draw_text(x,y-112,global.txt_score);
draw_text(x-128,y,global.txt_orbs + string(global.orbs_shot));
draw_text(x-128,y+32,global.txt_stat_combo + string(global.combo_high));
draw_text(x-128,y+64,global.txt_stat_chain + string(global.chain_high));
draw_text(x+128,y,global.txt_segments + string(global.segments));
draw_text(x+128,y+32,global.txt_powerups + string(global.powerups));
draw_text(x+128,y+64,global.txt_bonus + string(global.bonus_total));
draw_text(x-128,y+96,global.txt_accuracy + string(accuracy) + "%");
draw_text(x+128,y+96,global.txt_time+ string(display_time));

draw_set_alpha(1);