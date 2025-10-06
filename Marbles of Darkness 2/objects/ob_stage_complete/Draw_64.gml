/// @description Insert description here
// You can write your code in this editor

draw_set_font(global.font_large);
if global.colortext
draw_text_color(global.rm_width/2,global.rm_height/2,global.txt_complete,c_yellow,c_yellow,c_orange,c_orange,image_alpha);
else
draw_text(global.rm_width/2,global.rm_height/2,global.txt_complete);
draw_set_font(global.font_small);