/// @description Activate
// You can write your code in this editor

if instance_exists(ob_orb)
{
	i = 0;
	exit;
}
activated = 1;

path = global.path[pathnr];
pos = global.end_bonus[pathnr]
path_start(path,0,path_action_stop,true);
path_position = 1;
length = path_get_length(path);
points = round((1-pos)*10000);
global.bonus_total += points;