/// @description Create level selection
// You can write your code in this editor

//Initialize variables
x = 224;
y = 160;
spd = 32;
global.sliderpos = 0;
global.selected = global.freeplay_select;
global.dif_user = 1;
global.difficulty = 1;
dragging = 0;

//Create map list
for(i = 1; i <= global.maps; i += 1)
{
	button = instance_create_depth(x,y,depth,ob_level_buttons);
	button.i = i;
	y += 64;
}

//Slider
depth -= 25;
global.slider_limit = global.maps*64-(global.rm_height-256);
if global.slider_limit < 0
global.slider_limit = 0;

x = global.rm_width-((global.rm_width-464)/2);
y = global.rm_height/2;
instance_create_depth(448,y,depth-50,ob_slider_bar);

//Difficulty buttons
if global.gamemode == 2
{
	ix = x - (global.difs-1)*48;
	for (i = 1; i <= global.difs; i++)
	{
		a = instance_create_depth(ix,y+160,depth-25,ob_button_difficulty);
		a.i = i;
		ix += 96;
	}
}