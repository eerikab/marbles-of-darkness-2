/// @description Insert description here
// You can write your code in this editor

draw_set_font(global.font_large);
draw_text(global.rm_width/2,48,global.txt_credits);
draw_set_font(global.font_small);

draw_text(global.rm_width/4+64,global.rm_height/4+64,global.txt_credits_line[1]);
draw_text(global.rm_width*3/4-64,global.rm_height/4+64,global.txt_credits_line[2]);
draw_text(global.rm_width/4+64,global.rm_height*3/4-64,global.txt_credits_line[3]);
draw_text(global.rm_width*3/4-64,global.rm_height*3/4-96,global.txt_credits_line[4]);