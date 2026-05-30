/// @description Toggle visibility
// You can write your code in this editor

// If colour has no assigned sprite, try find another one that does
while colour > 1 and global.sprite_orb[colour] == 0
{
	colour -= 1;
}
while colour < 9 and global.sprite_orb[colour] == 0
{
	colour += 1;
}

sprite_index = global.sprite_orb[colour];

if ob_instructions.page == 1
visible = 1;
else
visible = 0;