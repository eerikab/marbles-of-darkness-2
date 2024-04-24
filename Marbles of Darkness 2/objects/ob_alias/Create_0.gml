/// @description Insert description here
// You can write your code in this editor

sprite_index = global.sprite_button_round;
image_speed = 0;

if gpu_get_texfilter()
image_index = 2;
else
image_index = 0;

image_xscale = 0.5;
image_yscale = 0.5;

alarm[0] = 1;