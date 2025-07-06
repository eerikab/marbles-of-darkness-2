/// @description Load music
// You can write your code in this editor

global.mus_menu = audio_create_stream(global.directory + "sounds/mu_menu.ogg");
i = 1;
while true
{
	global.mus_game[i] = audio_create_stream(global.directory + "sounds/mu_game" + string(i) + ".ogg");
	if audio_exists(global.mus_game[i])
	i += 1;
	else
	{
		global.mus_game_num = i - 1;
		break;
	}
}
if global.mus_game_num < 1
global.mus_game_num = 1;
global.mus_warning = audio_create_stream(global.directory + "sounds/mu_warning.ogg");
sc_sound_gain(0,global.music);

sc_load_advance();