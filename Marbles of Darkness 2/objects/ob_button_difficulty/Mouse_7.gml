/// @description Insert description here
// You can write your code in this editor

if image_index = 2 and !instance_exists(ob_block)
{
	global.difficulty = i;
	a = instance_create_depth(x,y,0,ob_transition);
	a.nextroom = rm_game;
}