if !audio_is_playing(global.mus_menu)
{
	audio_stop_all()
	audio_play_sound(global.mus_menu,0,1);
}