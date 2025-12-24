/// @description Toggle debug
// You can write your code in this editor

if keyboard_check_pressed(vk_f3) and global.debug
{
	global.debug = 0;
	show_debug_overlay(false);
}

if keyboard_check(vk_control) and keyboard_check(vk_shift) and keyboard_check(vk_f3)
{
	global.debug = 1;
	show_debug_overlay(true);
}