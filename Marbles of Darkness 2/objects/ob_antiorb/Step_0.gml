/// @description Insert description here
// You can write your code in this editor

//Movement
pos -= 32/length;
path_position = pos;
depth = (0 - path_get_speed(path, pos))+50

if global.ls_orbs[pathnr,0].pos > pos - 32/length 
{
	global.level_progress += 1;
	score += 100;
	instance_destroy( global.ls_orbs[pathnr,0]);
	instance_destroy()
}