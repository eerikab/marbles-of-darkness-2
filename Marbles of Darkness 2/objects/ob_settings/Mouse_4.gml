/// @description Toggle debug
// You can write your code in this editor

if mouse_y < y - 160
{
	if global.debug
	{
		clicks = 0;
		global.debug = 0;
		show_debug_overlay(false);
	}
	else
	{
		clicks += 1;
		if clicks == 5
		{
			global.debug = 1;
			show_debug_overlay(true);
		}
	}
}