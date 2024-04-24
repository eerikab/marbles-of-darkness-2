/// @description Insert description here
// You can write your code in this editor

//Move away from the path
if move > 0
{
	x += lengthdir_x(0.5,direction);
	y += lengthdir_y(0.5,direction);
	move -= 0.5;
}
cooldown -= 1;
image_alpha = cooldown/300;
if cooldown = 0
instance_destroy();