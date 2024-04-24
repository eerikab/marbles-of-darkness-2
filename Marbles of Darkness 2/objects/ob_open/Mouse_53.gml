/// @description Go to menu
// You can write your code in this editor

if progress = 100 and !instance_exists(ob_block)
{
	a = instance_create_depth(x,y,0,ob_transition);
	a.nextroom = rm_menu;
}