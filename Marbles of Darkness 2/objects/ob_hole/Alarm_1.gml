/// @description Fade in
// You can write your code in this editor

if alpha >= 1
exit;

if alpha == 0
{
	instance_create_depth(x,y,-80,ob_intro_glow);
}
alpha += 0.05;
image_blend = merge_color(c_black,c_white,alpha);
alarm[1] = 1;