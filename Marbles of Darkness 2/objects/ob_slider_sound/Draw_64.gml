/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_set_alpha(image_alpha);
if y < ob_settings.y
draw_text(global.rm_width/2,y-32,global.txt_music + string(round(global.music*100)) + "%");
else
draw_text(global.rm_width/2,y-32,global.txt_sound + string(round(global.sound*100)) + "%");
draw_set_alpha(1);