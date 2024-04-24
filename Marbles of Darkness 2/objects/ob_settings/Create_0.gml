/// @description Insert description here
// You can write your code in this editor

sprite_index = global.sprite_board;
image_alpha = 0;
alarm[0] = 1;
spd = 0.02;
	

button = instance_create_depth(x-64,y-112,depth-25,ob_fullscreen);
button.image_alpha = 0;
button = instance_create_depth(x,y-32,depth-25,ob_slider_bar_h);
button.image_alpha = 0;
button = instance_create_depth(x,y+32,depth-25,ob_slider_bar_h);
button.image_alpha = 0;
button = instance_create_depth(x-64,y+80,depth-25,ob_vsync);
button.image_alpha = 0;
button = instance_create_depth(x-64,y+128,depth-25,ob_alias);
button.image_alpha = 0;

button = instance_create_depth(x,y+192,depth-25,ob_button_close);
button.image_alpha = 0;

if room = rm_game
{
	button = instance_create_depth(x+192,y+192,depth-25,ob_button_mainmenu);
	button.image_alpha = 0;
	button = instance_create_depth(x-192,y+192,depth-25,ob_button_instruct);
	button.image_alpha = 0;
	button.sprite_index = global.sprite_button;
}
else
{
	button = instance_create_depth(x+192,y+192,depth-25,ob_button_stats);
	button.image_alpha = 0;
	button = instance_create_depth(x-192,y+192,depth-25,ob_button_credits);
	button.image_alpha = 0;
}