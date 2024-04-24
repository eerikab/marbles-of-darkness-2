/// @description Camera movement
// You can write your code in this editor

//Edges
mouse = mouse_x - camera_get_view_x(view_camera[0]);
if mouse < 128 and global.view > 0 and !dragging
{
	global.view -= 16;
	if global.view < 0
	global.view = 0
}
if mouse > global.rm_width-128 and global.view < global.view_end - global.rm_width
and !dragging
{
	global.view += 16;
	if global.view > global.view_end - global.rm_width
	global.view = global.view_end - global.rm_width;
}

//Dragging
if dragging
{
	global.view += mouse_prev - window_mouse_get_x();
	mouse_prev = window_mouse_get_x();
	global.view = clamp(global.view, 0, global.view_end - global.rm_width);
}

camera_set_view_pos(view_camera[0],global.view,0);