/// @description Load sounds
// You can write your code in this editor

global.sou_bar_fill = audio_create_stream(global.directory + "sounds/so_bar_fill.ogg");
global.sou_button_click = audio_create_stream(global.directory + "sounds/so_button_click.ogg");
global.sou_extra_life = audio_create_stream(global.directory + "sounds/so_extra_life.ogg");
global.sou_fail = audio_create_stream(global.directory + "sounds/so_fail.ogg");
global.sou_level_complete = audio_create_stream(global.directory + "sounds/so_level_complete.ogg");
global.sou_level_start = audio_create_stream(global.directory + "sounds/so_level_start.ogg");
global.sou_match = audio_create_stream(global.directory + "sounds/so_match.ogg");
global.sou_orb_hit = audio_create_stream(global.directory + "sounds/so_orb_hit.ogg");
global.sou_power_accuracy = audio_create_stream(global.directory + "sounds/so_power_accuracy.ogg");
global.sou_power_antiorb = audio_create_stream(global.directory + "sounds/so_power_antiorb.ogg");
global.sou_power_blocker = audio_create_stream(global.directory + "sounds/so_power_blocker.ogg");
global.sou_power_bullet = audio_create_stream(global.directory + "sounds/so_power_bullet.ogg");
global.sou_power_colourbomb = audio_create_stream(global.directory + "sounds/so_power_colourbomb.ogg");
global.sou_power_colourbomb_blast = audio_create_stream(global.directory + "sounds/so_power_colourbomb_blast.ogg");
global.sou_power_colourcloud = audio_create_stream(global.directory + "sounds/so_power_colourcloud.ogg");
global.sou_power_colourcloud_blast = audio_create_stream(global.directory + "sounds/so_power_colourcloud_blast.ogg");
global.sou_power_electric = audio_create_stream(global.directory + "sounds/so_power_electric.ogg");
global.sou_power_electric_blast = audio_create_stream(global.directory + "sounds/so_power_electric_blast.ogg");
global.sou_power_fireball = audio_create_stream(global.directory + "sounds/so_power_fireball.ogg");
global.sou_power_fireball_blast = audio_create_stream(global.directory + "sounds/so_power_fireball_blast.ogg");
global.sou_power_group = audio_create_stream(global.directory + "sounds/so_power_group.ogg");
global.sou_power_inferno = audio_create_stream(global.directory + "sounds/so_power_inferno.ogg");
global.sou_power_poison = audio_create_stream(global.directory + "sounds/so_power_poison.ogg");
global.sou_power_poison_blast = audio_create_stream(global.directory + "sounds/so_power_poison_blast.ogg");
global.sou_power_precise = audio_create_stream(global.directory + "sounds/so_power_precise.ogg");
global.sou_power_reverse = audio_create_stream(global.directory + "sounds/so_power_reverse.ogg");
global.sou_power_slow = audio_create_stream(global.directory + "sounds/so_power_slow.ogg");
global.sou_power_stop = audio_create_stream(global.directory + "sounds/so_power_stop.ogg");
global.sou_power_triple = audio_create_stream(global.directory + "sounds/so_power_triple.ogg");
global.sou_power_white = audio_create_stream(global.directory + "sounds/so_power_white.ogg");
global.sou_power_white_blast = audio_create_stream(global.directory + "sounds/so_power_white_blast.ogg");
global.sou_power_wild = audio_create_stream(global.directory + "sounds/so_power_wild.ogg");
global.sou_pusher_break = audio_create_stream(global.directory + "sounds/so_pusher_break.ogg");
global.sou_rolling = audio_create_stream(global.directory + "sounds/so_rolling.ogg");
global.sou_shoot = audio_create_stream(global.directory + "sounds/so_shoot.ogg");
global.sou_stage_complete = audio_create_stream(global.directory + "sounds/so_stage_complete.ogg");
global.sou_swap = audio_create_stream(global.directory + "sounds/so_swap.ogg");

sc_sound_gain(1,global.sound);

if error_raised
exit;
progress = 50;
alarm[3] = delay;
audio_play_sound(global.mus_menu,0,1);