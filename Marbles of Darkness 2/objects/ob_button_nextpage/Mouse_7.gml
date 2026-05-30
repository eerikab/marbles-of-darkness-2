/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block) and image_alpha == 1
{
	ob_instructions.page += 1;
	if ob_instructions.page > global.pages
	ob_instructions.page = 1;
}