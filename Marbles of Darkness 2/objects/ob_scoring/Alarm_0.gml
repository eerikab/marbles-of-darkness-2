/// @description Insert description here
// You can write your code in this editor

//Put text together
if chain > 0
text = string(point_get) + "\n" + global.txt_chain + string(chain) + "X";
else if combo > 1
text = string(point_get) + "\n" + global.txt_combo + string(combo) + "X";
else 
text = string(point_get);

//Stay in bounds
x = clamp(x, 16+string_width(text)/2, room_width-16-string_width(text)/2);
y = clamp(y, 32+string_height(text)/2, room_height-16-string_height(text)/2);