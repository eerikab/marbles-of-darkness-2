if !audio_is_playing(global.mus_menu)
{
	audio_stop_all()
	audio_play_sound(global.mus_menu,0,1);
}
sc_window();

sc_background(global.back_play);

if global.gamemode == 2
instance_destroy(ob_button_adv_play);
if global.gamemode == 3
instance_destroy(ob_button_difficulty);