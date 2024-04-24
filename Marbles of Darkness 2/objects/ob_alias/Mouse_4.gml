/// @description Insert description here
// You can write your code in this editor

if image_alpha == 1
{
	gpu_set_texfilter(1 - gpu_get_texfilter());
}

if gpu_get_texfilter()
image_index = 2;
else
image_index = 0;