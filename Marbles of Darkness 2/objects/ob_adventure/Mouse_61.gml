/// @description Pan left
// You can write your code in this editor

if global.view > 0 and !dragging
{
	global.view -= 32;
	if global.view < 0
	global.view = 0
}