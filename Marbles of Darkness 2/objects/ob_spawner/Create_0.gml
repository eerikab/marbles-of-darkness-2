/// @description Insert description here
// You can write your code in this editor

path = global.path[pathnr];
path_start(path,0,path_action_stop,true);
length = path_get_length(path);
cooldown = global.dif_cooldown[global.difficulty] * game_get_speed(gamespeed_fps);
instance_deactivate_object(self);