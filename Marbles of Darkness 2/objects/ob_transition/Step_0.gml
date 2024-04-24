/// @description Insert description here
// You can write your code in this editor

alpha += dir;
if alpha == 1
{
	dir *= -1;
	room_goto(nextroom);
}
if alpha == 0
instance_destroy();