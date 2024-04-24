// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_background(_background){
	//Set background for current room
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_change(back_id,_background);
	//If enabled, stretch bg to fill the screen
	layer_background_stretch(back_id,global.background_stretch);
}