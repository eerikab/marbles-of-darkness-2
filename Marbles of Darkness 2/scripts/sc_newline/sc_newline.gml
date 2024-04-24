// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_newline(sect,read,def){
	return string_hash_to_newline(ini_read_string(sect,read,def));
}