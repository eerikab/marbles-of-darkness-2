/// @description Fade out menu music
// You can write your code in this editor

if start
exit;

gain -= 0.008;
audio_sound_gain(global.mus_menu,gain*global.music,0);
if gain > 0
alarm[4] = 1;