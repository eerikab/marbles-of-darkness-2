/// @description Insert description here
// You can write your code in this editor

if image_index == 2 and !instance_exists(ob_block)
{
	ob_instructions.page += 1;
	if ob_instructions.page == 5
	ob_instructions.page = 1;
}