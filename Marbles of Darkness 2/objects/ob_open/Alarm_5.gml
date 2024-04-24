/// @description Load tunnels
// You can write your code in this editor

//Load images
for (i = 1; i <= global.maps; i++)
{
	if global.tunnel[i] != 0
	{
		area = "Tunnels";
		name = global.tunnel[i]
		global.tunnel[i] = sprite_add(global.directory + "tunnels/" + global.tunnel[i] + ".png",1,0,1,0,0);
		if !sprite_exists(global.tunnel[i])
		sc_error("Map " + string(i) + " tunnel cutout " + name + " not found");
		sprite_collision_mask(global.tunnel[i],1,0,0,0,0,0,bboxkind_precise,192);
	}
}

//sc_path_export();

if error_raised
exit;
alarm[6] = delay;
progress = 80;
