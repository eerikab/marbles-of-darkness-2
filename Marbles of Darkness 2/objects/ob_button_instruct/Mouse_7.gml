/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and 
(!instance_exists(ob_board_par) or sprite_index = global.sprite_button) and image_alpha == 1
{
	a = instance_create_depth(x,y,0,ob_transition);
	a.nextroom = rm_instructions;
}