/// @description Move map list down
// You can write your code in this editor

if global.sliderpos < global.slider_limit
global.sliderpos += spd;
if global.sliderpos > global.slider_limit
global.sliderpos = global.slider_limit;
