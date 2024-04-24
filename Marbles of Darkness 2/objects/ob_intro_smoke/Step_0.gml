/// @description Insert description here
// You can write your code in this editor

path_position -= 0.005;
x = path_get_x(path,path_position);
y = path_get_y(path,path_position);

if path_get_speed(path,path_position) > 50
{
	depth = -50;
	effect_create_above(ef_smoke,x,y,1,c_black);
}
else
{
	depth = 50;
	effect_create_below(ef_smoke,x,y,1,c_black);
}

if path_position == 0
instance_destroy();