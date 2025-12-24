/// @description Insert description here
// You can write your code in this editor

if image_alpha == 1
global.skip_instruct = 1 - global.skip_instruct;

if global.skip_instruct
image_index = 2;
else
image_index = 0;

ini_open(global.savefile + "save.ini");
ini_write_real("Settings","skip",global.skip_instruct);
ini_close();