/// @description Insert description here
// You can write your code in this editor

//Move away from the path
if drop
{
	yspeed += 0.2;
	x += xspeed;
	y += yspeed;
	if place_meeting(x, y, ob_shooter)
	alarm[0] = 1
	if y > room_height + sprite_height/2
	instance_destroy();
}
else
{
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
}