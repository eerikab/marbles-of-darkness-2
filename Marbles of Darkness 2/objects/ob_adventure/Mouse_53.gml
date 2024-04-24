/// @description Start dragging
// You can write your code in this editor

if mouse_y < room_height - 96
{
	dragging = 1;
	mouse_prev = window_mouse_get_x();
}