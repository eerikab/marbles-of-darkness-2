/// @description Insert description here
// You can write your code in this editor

//draw_rectangle(x1,y1,x2,y2,true);
draw_self();
if global.unlocked[i] or global.free_unlock
{
	draw_text(x+50,y, global.title[i]);
	draw_sprite_stretched(global.background[i],0,x1+4,y1+4,100,56);
}
else
{
	draw_text_color(x+50,y,global.txt_locked,c_gray,c_gray,c_gray,c_gray,1);
	draw_sprite_stretched_ext(global.background[i],0,x1+4,y1+4,100,56,make_color_rgb(32,32,32),1);
}