/// @description Insert description here
// You can write your code in this editor

if x < global.rm_width/2
{
	if global.instruct_pad
	{
		y = ob_instruct_shooter.y-global.pad_offset;
	}
	else
	{
		y = ob_instruct_shooter.y-global.shooter_offset;
	}
}