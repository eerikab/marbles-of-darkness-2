/// @description Insert description here
// You can write your code in this editor

if mouse_y > 128 and mouse_y < room_height - 128 and (global.unlocked[i] or global.free_unlock)
{
	global.selected = i;
	global.freeplay_select = i;
}