/// @description Load tunnels
// You can write your code in this editor

area = "Tunnels";
directory = "tunnels";
for (i = 1; i <= global.maps; i++)
{
	if (global.tunnel[i] != 0)
	{
		name = global.tunnel[i];
		global.tunnel[i] = sc_load_sprite( global.tunnel[i],1,0,0,0,
			"Map " + string(i) + " tunnel cutout " + name);
	}
}

sc_load_advance();