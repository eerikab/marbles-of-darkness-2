/// @description Level skip cheat
// You can write your code in this editor

if global.skip and (global.adv_stage + 1 < array_length(global.lvl_adv) 
or global.adv_level + 1 < array_length(global.lvl_adv[global.adv_stage]))
{
	global.adv_level += 1;
	if global.adv_level > global.lvl_stage[global.adv_stage]
	{
		global.adv_level = 1;
		global.adv_stage += 1;
	}
	alarm[0] = 1;
}