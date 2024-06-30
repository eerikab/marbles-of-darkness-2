// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function sc_path_import(_name){
	area = "Paths"
	path = path_add();
	if !file_exists(global.directory + "paths/" + _name + ".txt")
	{
		sc_error(_name + " not found");
		exit;
	}
	file = file_text_open_read(global.directory + "paths/" + _name + ".txt");
	while !file_text_eof(file)
	{
		ix = file_text_read_real(file);
		iy = file_text_read_real(file);
		spd = file_text_read_real(file);
		path_add_point(path,ix,iy,spd);
		file_text_readln(file);
	}
	file_text_close(file);
	path_set_closed(path,false);
	path_set_kind(path,1);
	path_set_precision(path,8);
	if path_get_length(path) == 0
	sc_error(_name + " is not a valid path");
	return(path)
}
