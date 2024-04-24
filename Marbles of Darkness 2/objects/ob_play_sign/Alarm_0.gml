/// @description Insert description here
// You can write your code in this editor

//Fade in/out
image_alpha += spd;
if image_alpha > 0 and image_alpha < 1
alarm[0] = 1;

//Button visibility
with(ob_button_par)
{
	if x < global.rm_width/2+64
	image_alpha = other.image_alpha;
	if image_alpha = 0
	instance_destroy();
}
with(ob_adventure_difficulty)
{
	image_alpha = other.image_alpha;
	if image_alpha = 0
	instance_destroy();
}
with(ob_adventure_length)
{
	image_alpha = other.image_alpha;
	if image_alpha = 0
	instance_destroy();
}

if image_alpha = 0
instance_destroy();