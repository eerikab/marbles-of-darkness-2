/// @description Lights, warning check
// You can write your code in this editor

if !active
exit;

if room == rm_instructions
{
	warning = 1;
	if ob_instructions.page == 1
	visible = 1;
	else
	visible = 0;
}
else if (pathnr == 0)
{
	warning = 0;
	for (i = 1; i<=global.paths; i++)
	{
		if (array_length(global.ls_orbs[i]) > 0 and global.ls_orbs[i,0].pos > 1-dist/length)
		{
			global.warning = 1;
			warning = 1;
		}
	}
}
else if (array_length(global.ls_orbs[pathnr]) > 0 and global.ls_orbs[pathnr,0].pos > 1-dist/length)
or global.lost
{
	global.warning = 1;
	warning = 1;
}
else 
warning = 0;

if warning
{
	if global.lost and room == rm_game
	{
		if alpha1 < 1
		alpha1 += spd
	}
	else
	{
		alpha1 += dir*spd
		if alpha1 = 1 or alpha1 = 0
		dir *= -1
	}
	
	if alpha2 < 1
	alpha2 += spd
}
else
{
	if alpha1 > 0
	alpha1 -= spd
	if alpha2 > 0
	alpha2 -= spd
	if dir != 1
	dir = 1
}

angle += global.light_rotation;