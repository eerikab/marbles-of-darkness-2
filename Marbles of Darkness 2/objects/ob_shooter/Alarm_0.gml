/// @description Insert description here
// You can write your code in this editor

//Knock back
offset += dir;
if offset >= 4
dir = -1;
if offset > 0
alarm[0] = 1;

if mode = 1
{
	y = ystart+offset;
}
else
{
	x = xstart-lengthdir_x(offset,image_angle);
	y = ystart-lengthdir_y(offset,image_angle);
}