/// @description Insert description here
// You can write your code in this editor

//Follow orb, otherwise remove
if !instance_exists(orb)
{
	instance_destroy();
	exit;
}

x = orb.x + 4;
y = orb.y + 4;
depth = orb.depth+1;
visible = orb.visible;
image_angle = orb.image_angle;

if orb.path_position == 0
visible = false;