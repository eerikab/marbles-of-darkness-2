/// @description Insert description here
// You can write your code in this editor

if !window_has_focus() and instance_exists(ob_orb) and !paused
{
	sc_pause();
	paused = 1;
}