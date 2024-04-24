/// @description Insert description here
// You can write your code in this editor

if y < ob_settings.y
{
	if selected 
	{
		x = mouse_x;
		x = clamp(x,xstart,xstart+288);
		global.music = round((x-xstart)*100/288)/100;
		sc_sound_gain(0, global.music);
	}
	x = round(global.music*288+xstart);
}
else
{
	if selected 
	{
		x = mouse_x;
		x = clamp(x,xstart,xstart+288);
		global.sound = round((x-xstart)*100/288)/100;
		sc_sound_gain(1, global.sound);
	}
	x = round(global.sound*288+xstart);
}