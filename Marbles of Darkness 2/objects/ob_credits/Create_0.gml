/// @description Insert description here
// You can write your code in this editor

x = global.rm_width*3/4-160;
y = global.rm_height*3/4-32;
i = 0;
repeat(3)
{
	instance_create_depth(x,y,depth,ob_social,{i : i});
	x += 96;
	i += 1;
}