/// @description Insert description here
// You can write your code in this editor

//Fade in, out
image_alpha += spd;
if image_alpha > 0 and image_alpha < 1
alarm[0] = 1;

//Change button visibility
with(ob_button_par)
{
	if object_index == ob_button_close
	or object_index == ob_button_mainmenu
	or (object_index == ob_button_instruct and sprite_index = global.sprite_button)
	or object_index == ob_button_stats
	or object_index == ob_button_credits
	{
		image_alpha = other.image_alpha;
		if image_alpha = 0
		instance_destroy();
	}
}
with(ob_slider_bar_h)
{
	image_alpha = other.image_alpha;
	if image_alpha = 0
	instance_destroy();
}
with(ob_slider_sound)
{
	image_alpha = other.image_alpha;
	if image_alpha = 0
	instance_destroy();
}
with(ob_toggle_par)
{
	image_alpha = other.image_alpha;
	if image_alpha = 0
	instance_destroy();
}
with(ob_vsync)
{
	image_alpha = other.image_alpha;
	if image_alpha = 0
	instance_destroy();
}

if image_alpha = 0
{
	instance_destroy();
	if instance_exists(ob_hud)
	ob_hud.paused = 0;
	instance_activate_all();
}