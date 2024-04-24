// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_sound_stop(type){
	if type = 0
	{
		//Stop all sounds
		audio_stop_sound(global.mus_menu);
		audio_stop_sound(global.mus_warning);
		for (i = 0; i <= global.mus_game_num; i++)
		audio_stop_sound(global.mus_game[i]);
	}
}

function sc_sound_gain(type,gain){
	if type = 0
	{
		//Music volume
		audio_sound_gain(global.mus_menu,gain,0);
		audio_sound_gain(global.mus_warning,gain,0);
		for (i = 0; i <= global.mus_game_num; i++)
		audio_sound_gain(global.mus_game[i],gain,0);
	}
	if type = 1
	{
		//Sound volume
		audio_sound_gain(global.sou_bar_fill,gain,0);
		audio_sound_gain(global.sou_button_click,gain,0);
		audio_sound_gain(global.sou_extra_life,gain,0);
		audio_sound_gain(global.sou_fail,gain,0);
		audio_sound_gain(global.sou_level_complete,gain,0);
		audio_sound_gain(global.sou_level_start,gain,0);
		audio_sound_gain(global.sou_match,gain,0);
		audio_sound_gain(global.sou_orb_hit,gain,0);
		audio_sound_gain(global.sou_power_accuracy,gain,0);
		audio_sound_gain(global.sou_power_antiorb,gain,0);
		audio_sound_gain(global.sou_power_blocker,gain,0);
		audio_sound_gain(global.sou_power_bullet,gain,0);
		audio_sound_gain(global.sou_power_colourbomb,gain,0);
		audio_sound_gain(global.sou_power_colourbomb_blast,gain,0);
		audio_sound_gain(global.sou_power_colourcloud,gain,0);
		audio_sound_gain(global.sou_power_colourcloud_blast,gain,0);
		audio_sound_gain(global.sou_power_electric,gain,0);
		audio_sound_gain(global.sou_power_electric_blast,gain,0);
		audio_sound_gain(global.sou_power_fireball,gain,0);
		audio_sound_gain(global.sou_power_fireball_blast,gain,0);
		audio_sound_gain(global.sou_power_group,gain,0);
		audio_sound_gain(global.sou_power_inferno,gain,0);
		audio_sound_gain(global.sou_power_poison,gain,0);
		audio_sound_gain(global.sou_power_poison_blast,gain,0);
		audio_sound_gain(global.sou_power_precise,gain,0);
		audio_sound_gain(global.sou_power_reverse,gain,0);
		audio_sound_gain(global.sou_power_slow,gain,0);
		audio_sound_gain(global.sou_power_stop,gain,0);
		audio_sound_gain(global.sou_power_triple,gain,0);
		audio_sound_gain(global.sou_power_white,gain,0);
		audio_sound_gain(global.sou_power_white_blast,gain,0);
		audio_sound_gain(global.sou_power_wild,gain,0);
		audio_sound_gain(global.sou_pusher_break,gain,0);
		audio_sound_gain(global.sou_rolling,gain,0);
		audio_sound_gain(global.sou_shoot,gain,0);
		audio_sound_gain(global.sou_stage_complete,gain,0);
		audio_sound_gain(global.sou_swap,gain,0);
	}
}