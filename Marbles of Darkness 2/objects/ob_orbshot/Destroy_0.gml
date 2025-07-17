/// @description Reset orb shoot
// You can write your code in this editor

if new_ball = false and create_orb
instance_create_depth(x,room_height-80,depth,ob_orbshot);

//Remove from orb list
if matching
{
	index = array_get_index(global.ls_orbs[pathnr],id);
	if index != -1
	array_delete(global.ls_orbs[pathnr],index,1);
}