/// @description Level skip cheat
// You can write your code in this editor

if global.skip
{
	global.adv_level += 1;
	if global.adv_level > global.lvl_stage[global.adv_stage]
	{
		global.adv_level = 1;
		global.adv_stage += 1;
	}
	alarm[0] = 1;
}