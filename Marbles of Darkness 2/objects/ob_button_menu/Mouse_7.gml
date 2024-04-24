/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and !instance_exists(ob_settings) and instance_exists(ob_orb)
{
	sc_pause();
	ob_hud.paused = 1;
	instance_create_depth(global.rm_width/2,global.rm_height/2,depth-25,ob_settings);
}