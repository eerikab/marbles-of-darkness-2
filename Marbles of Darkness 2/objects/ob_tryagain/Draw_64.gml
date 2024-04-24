/// @description Draw messagebox
// You can write your code in this editor

draw_self();
draw_set_alpha(image_alpha);
draw_text(x,y-18,global.txt_fail);
if lives = 1
draw_text(x,y+18,global.txt_last);
else
draw_text(x,y+18,string(lives) + global.txt_left);
draw_set_alpha(1);