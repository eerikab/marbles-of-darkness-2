/// @description Pan right
// You can write your code in this editor

if global.view < global.view_end - global.rm_width and !dragging
{
	global.view += 32;
	if global.view > global.view_end - global.rm_width
	global.view = global.view_end - global.rm_width;
}