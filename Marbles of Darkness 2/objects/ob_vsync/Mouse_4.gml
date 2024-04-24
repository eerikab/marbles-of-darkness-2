/// @description Insert description here
// You can write your code in this editor

if image_alpha == 1
{
	global.vsync = 1 - global.vsync;
	display_reset(0,global.vsync);
}

if global.vsync
image_index = 2;
else
image_index = 0;