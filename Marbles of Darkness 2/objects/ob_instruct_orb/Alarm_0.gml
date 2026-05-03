/// @description Post-init
// You can write your code in this editor

if colour > global.orb_sprites
colour = global.orb_sprites;

sprite_index = global.sprite_orb[colour];
image_index = round(x*0.3) mod image_number;

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
	alarm[1] = 120;
}
