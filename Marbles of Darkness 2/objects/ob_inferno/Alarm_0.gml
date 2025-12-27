/// @description Remove a random orb
// You can write your code in this editor

//Get total of all segments
size_total = 0;
for (i = 1; i <= global.paths; i++)
{
	size[i] = array_length(global.ls_orbs[i]);
	size_total += size[i]
}
if size_total == 0
{
	instance_destroy();
	exit;
}

//Pick a random path
pathnr = irandom_range(1,global.paths);
counter = 0
while size[pathnr] == 0 and counter < 100
{
	pathnr = irandom_range(1,global.paths);
	counter += 1;
}
if counter == 100
{
	//If a valid path couldn't be chosen, abort everything
	instance_destroy();
	exit;
}

//Pick a random orb on the path
orb = global.ls_orbs[pathnr, irandom_range(0, array_length(global.ls_orbs[pathnr])-2)];
counter = 0;
while (orb.object_index != ob_orb and counter < 100) 
{
	orb = global.ls_orbs[pathnr, array_length(global.ls_orbs[pathnr]) - 2];
	counter += 1;
}
if counter == 100
{
	instance_destroy();
	exit;
}

//Remove the orb
with(orb)
{
	effect_create_above(ef_explosion,x,y,0, make_colour_rgb(255,128,0));
	instance_destroy();
	global.level_progress += 1;
	score += 100;
}

amount -= 1;
if amount > 0
alarm[0] = 4;