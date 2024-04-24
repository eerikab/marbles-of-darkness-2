/// @description Insert description here
// You can write your code in this editor

sprite_index = global.sprite_blocker;
path_start(global.path[pathnr],0,path_action_stop,true);
path_position = 1;
length = path_get_length(global.path[pathnr]);
life = round(10*global.dif_path[global.paths]);
max_life = life;