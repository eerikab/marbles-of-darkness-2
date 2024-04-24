/// @description Insert description here
// You can write your code in this editor

view_x = camera_get_view_x(view_camera[0]);
if global.view_end <= global.rm_width
{
	instance_destroy(ob_slider_bar_h);
	instance_destroy();
}
if selected 
{
	x = mouse_x;
	x = clamp(x, xstart+view_x, xstart+view_x+288);
	camera_set_view_pos(view_camera[0], round((x-xstart-view_x)*(global.view_end-global.rm_width)/288), 0);
	view_x = camera_get_view_x(view_camera[0]);
	global.view = view_x;
}
x = round(view_x*288/(global.view_end-global.rm_width)+xstart+view_x);