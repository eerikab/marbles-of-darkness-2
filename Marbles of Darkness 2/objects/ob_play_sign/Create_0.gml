/// @description Insert description here
// You can write your code in this editor

sprite_index = global.sprite_board;
image_alpha = 0;
alarm[0] = 1;
spd = 0.02;

button = instance_create_depth(x,y-96,depth-25,ob_button_adventure);
button.image_alpha = 0;
button = instance_create_depth(x,y-16,depth-25,ob_button_practice);
button.image_alpha = 0;
button = instance_create_depth(x,y+64,depth-25,ob_button_endless);
button.image_alpha = 0;

button = instance_create_depth(x,y+192,depth-25,ob_button_close);
button.image_alpha = 0;