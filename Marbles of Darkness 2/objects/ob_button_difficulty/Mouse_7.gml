/// @description Insert description here
// You can write your code in this editor

if image_index = 2 and !instance_exists(ob_block)
{
	global.difficulty = i;
	a = instance_create_depth(x,y,0,ob_transition);
	global.nextroom = rm_game;
	
	if global.skip_instruct or global.instruct_shown
	a.nextroom = rm_game;
	else
	{
		a.nextroom = rm_instructions;
		global.instruct_shown = 1;
	}
}