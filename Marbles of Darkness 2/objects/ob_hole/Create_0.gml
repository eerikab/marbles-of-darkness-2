/// @description Initialize
// You can write your code in this editor

sprite_index = global.sprite_hole;
active = 1;
pathnr = 1;
warning = 0;
alpha1 = 0;
alpha2 = 0;
angle = 0;
dir = 1;
spd = 0.02;
dist = 800;
alpha = 0;
if room == rm_game
{
	image_blend = c_black;
	alarm[1] = 60;
	alarm[0] = 1;
	active = 0;
}
if room == rm_instructions
warning = 1;