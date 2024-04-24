/// @description Dragging
// You can write your code in this editor

if dragging
{
	global.sliderpos += mouse_prev - mouse_y;
	mouse_prev = mouse_y;
	global.sliderpos = clamp(global.sliderpos,0,global.slider_limit);
}

