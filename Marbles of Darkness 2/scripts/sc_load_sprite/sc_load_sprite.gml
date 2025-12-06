// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Scripts to help in loading assets at startup

function sc_load_sprite(filename, imgnum, center=true, x_origin=0, y_origin=0, name=""){
	//Load a sprite
	
	if (name == "")
	name = filename;
	
	file = sprite_add(global.directory + directory + "/" + filename + ".png",imgnum,
		0,1,x_origin,y_origin);
	//Precise collision mask with at least 75% opacity
	sprite_collision_mask(file,1,0,0,0,0,0,bboxkind_precise,192);
	if (center)
		sprite_set_offset(file, sprite_get_width(file)/2, sprite_get_height(file)/2);
	if (!sprite_exists(file))
		sc_error(name + " not found");
	return file;
}

function sc_loading_text(text){
	//Set text on progress bar
	if (text != "")
	txt_load_current = text;
	else
	txt_load_current = txt_loading;
}

function sc_load_advance(){
	//Move forwards to the next step in startup loading
	if (error_raised)
	exit;
	
	if (progress-1 < steps)
	{
		alarm[progress] = delay;
		sc_loading_text(txt_load[progress]);
	}
	else
	{
		global.loaded = true;
	}
	progress += 1;
}