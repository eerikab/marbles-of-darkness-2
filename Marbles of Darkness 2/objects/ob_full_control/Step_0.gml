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

//Construct debug text
if global.debug
{
	text = "F3 to hide debug overlay\nFPS " + string(fps)
		+ "\nWindow " + string(window_get_width()) + "x" + string(window_get_height())
		+ "\n\n";
	if room == rm_game
	{
		text += "Length";
		for (i = 1; i <= global.paths; i++)
		text += " " + string(path_get_length(global.path[i]));
		if instance_exists(ob_pusher)
		{
			text += "\nSpeed";
			with(ob_pusher)
			other.text += " " + string(spd);
			text += "\nFirst pos";
			for (i = 1; i <= global.paths; i++)
			{
				if array_length(global.ls_orbs[i]) > 0
				text += " " + string(global.ls_orbs[i,0].pos);
			}
			text += "\nKnockback";
			with(ob_orb)
			{
				if knockback > 0
				other.text += " " + string(knockback);
			}
		}
	}
}