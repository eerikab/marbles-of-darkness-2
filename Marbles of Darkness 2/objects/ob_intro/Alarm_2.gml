/// @description Insert description here
// You can write your code in this editor

alpha3 -= 0.015;
alpha2 -= 0.02;
alpha1 -= 0.02;

if alpha3 = 0
{
	//instance_destroy(ob_intro_glow);
	instance_destroy(ob_intro_smoke);
	instance_activate_object(ob_spawner);
	if !audio_is_playing(global.lvl_music)
	{
		audio_stop_all();
		audio_sound_gain(global.mus_menu,global.music,0);
		audio_play_sound(global.lvl_music,0,1);
		audio_play_sound(global.mus_warning,0,1);
		audio_pause_sound(global.mus_warning);
	}
	instance_destroy();
}
else
alarm[2] = 1;