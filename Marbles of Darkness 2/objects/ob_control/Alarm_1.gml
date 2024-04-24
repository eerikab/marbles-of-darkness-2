/// @description Place holes
// You can write your code in this editor

i = 1;
while i <= global.paths
{
	a = instance_create_depth(x,y,-25,ob_hole);
	a.pathnr = i;
	if !instance_exists(ob_intro)
	ob_hole.image_alpha = 1;
	a = instance_create_depth(x,y,-25,ob_final_bonus);
	a.pathnr = i;
	i += 1;
}

global.path_multi = global.dif_path[global.paths];