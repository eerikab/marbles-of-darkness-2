/// @description Fade into the level
// You can write your code in this editor

if alpha1 == 1
{
	for(i = 1; i <= global.paths; i++)
	{
		instance_create_depth(-64,-64,-50,ob_intro_smoke,{path : global.path[i]});
	}
	sc_sound_stop(0);
}
if alpha1 > 0
{
	alpha1 -= 0.04;
	if alpha1 < 0
	alpha1 = 0;
	sc_intro_color(merge_color(c_white, c_black, alpha1));
}
else if x > 0
x -= room_width/32;
else if start == 0
alpha2 += 0.02;

if alpha2 < 1
alarm[0] = 1;
else
alarm[2] = 100;