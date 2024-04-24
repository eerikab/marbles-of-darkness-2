/// @description Load backgrounds
// You can write your code in this editor

//Load images
area = "Backgrounds"
global.back_board = sprite_add(global.directory + "backgrounds/bg_board.png",1,0,1,0,0);
global.back_map = sprite_add(global.directory + "backgrounds/bg_map.png",1,0,1,0,0);
global.back_play = sprite_add(global.directory + "backgrounds/bg_freeplay.png",1,0,1,0,0);
if !sprite_exists(global.back_board)
sc_error("bg_board not found");
if !sprite_exists(global.back_map)
sc_error("bg_map not found");
for (i = 1; i <= global.maps; i++)
{
	name = global.background[i];
	global.background[i] = sprite_add(global.directory + "backgrounds/" + global.background[i] + ".png",1,0,1,0,0);
	if !sprite_exists(global.background[i])
	sc_error("Map " + string(i) + " background " + name + " not found");
}

if error_raised
exit;
alarm[5] = delay;
progress = 70;
