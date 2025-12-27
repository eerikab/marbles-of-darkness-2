/// @description Poison
// You can write your code in this editor

counter = 4;
i = 1;
forwards = 1;
backwards = 1;
poison = 7;

while poison > 0
{
	if forwards
	{
		if index-i >= 0
		{
			orb = global.ls_orbs[pathnr, index-i];
			if orb != 0 and is_numeric(orb) and instance_exists(orb) and orb.object_index == ob_orb
			{
				orb.alarm[4] = counter;
			}
			else
			forwards = 0;
		}
		else
		forwards = 0;
	}
	if backwards
	{
		orb = global.ls_orbs[pathnr, index+i];
		
		if orb != 0 and is_numeric(orb) and instance_exists(orb) and orb.object_index == ob_orb
		{
			orb.alarm[4] = counter;
		}
		else
		backwards = 0;
	}
	poison -= 1;
	counter += 4;
	i += 1;
}
		
alarm[4] = 1;