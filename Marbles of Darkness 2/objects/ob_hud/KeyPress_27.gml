/// @description Spawn menu
// You can write your code in this editor

if !paused and !instance_exists(ob_settings) and instance_exists(ob_orb)
{
	sc_pause();
	paused = 1;
	instance_create_depth(global.rm_width/2,global.rm_height/2,depth-25,ob_settings);
}
else if instance_exists(ob_settings)
{
	with(ob_board_par)
	{
		spd = -0.02;
		alarm[0] = 1;
	}
	
	sc_settings();
}