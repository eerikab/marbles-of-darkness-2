/// @description Insert description here
// You can write your code in this editor

if image_alpha == 0
{
	instance_create_depth(x,y,-75,ob_intro_glow);
}
image_alpha += 0.1;
if image_alpha < 1
alarm[2] = 1;