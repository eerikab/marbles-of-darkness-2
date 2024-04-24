/// @description Music, lives
// You can write your code in this editor

//Music
if global.game == 1
{
	if global.warning
	{
		if audio_is_playing(global.lvl_music)
		audio_pause_sound(global.lvl_music);
		if audio_is_paused(global.mus_warning)
		audio_resume_sound(global.mus_warning);
	}
	if !global.warning
	{
		if audio_is_paused(global.lvl_music)
		audio_resume_sound(global.lvl_music);
		if audio_is_playing(global.mus_warning)
		audio_pause_sound(global.mus_warning);
	}
}

//Lives
if global.gamemode == 1 and score >= global.adv_live_score + global.extralife
{
	while score >= global.adv_live_score + global.extralife
	{
		global.adv_live_score += global.extralife;
		global.adv_lives += 1;
	}
	lives = global.adv_lives;
	audio_play_sound(global.sou_extra_life,0,0);
	object = instance_create_depth(room_width/2+global.offset[1],room_height-global.hud_height-16,0,ob_scoring);
	object.blend = 0;
	object.point_get = global.txt_extralife;
}