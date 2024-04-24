/// @description Insert description here
// You can write your code in this editor

active = 1;
level_score = score - global.start_score;

button = instance_create_depth(x,y+192,depth-25,ob_button_next);
button.image_alpha = 0;
global.stat_wins += 1;

audio_stop_all();
audio_play_sound(global.sou_level_complete,0,0);