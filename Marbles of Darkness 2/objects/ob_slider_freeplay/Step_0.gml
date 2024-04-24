/// @description Insert description here
// You can write your code in this editor

if global.slider_limit <= 0
{
	instance_destroy(ob_slider_bar);
	instance_destroy();
}
if selected 
{
	y = mouse_y;
	y = clamp(y,ystart,ystart+288);
	global.sliderpos = round((y-ystart)*global.slider_limit/288);
}
y = round(global.sliderpos*288/global.slider_limit+ystart);
