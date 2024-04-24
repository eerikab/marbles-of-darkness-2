// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_window(){
	//Set game area size
	room_width = global.rm_width
	room_height = global.rm_height
	camera_set_view_size(view_camera[0],room_width,room_height);
}