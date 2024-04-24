/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sprite_index,image_index,xstart,ystart,1,1,0,c_white,image_alpha);
draw_set_alpha(image_alpha);
draw_text(xstart,ystart,global.txt_button_menu);
draw_set_alpha(1);