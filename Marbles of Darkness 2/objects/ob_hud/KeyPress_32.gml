/// @description Toggle pause
// You can write your code in this editor

if instance_exists(ob_orb)
{
	sc_pause();
	paused = 1;
}
else if paused == 1
{
	instance_activate_all();
	paused = 0;
}