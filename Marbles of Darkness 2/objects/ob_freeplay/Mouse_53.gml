/// @description Start dragging
// You can write your code in this editor


if mouse_x < room_width/2
and mouse_y > 128 and mouse_y < room_height - 128
{
	dragging = 1;
	mouse_prev = mouse_y;
}