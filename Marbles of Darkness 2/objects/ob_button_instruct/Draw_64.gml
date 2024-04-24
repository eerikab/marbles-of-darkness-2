/// @description Insert description here
// You can write your code in this editor

if sprite_index == global.sprite_button_big
exit;

draw_self();
draw_set_alpha(image_alpha);
draw_text(x,y,global.txt_instruct_title);
draw_set_alpha(1);