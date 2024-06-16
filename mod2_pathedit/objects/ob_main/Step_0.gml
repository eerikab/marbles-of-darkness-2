/// @description Insert description here
// You can write your code in this editor

if question > 0
exit;

//Selecting points
if mouse_check_button_pressed(mb_left) and window_mouse_get_x() < hud_left
{
	selected = -1;
	for (i = 0; i < path_get_number(path); i++)
	{
		if point_distance(mouse_x, mouse_y, 
			path_get_point_x(path,i), path_get_point_y(path,i)) < 16
		selected = i;
	}

	if selected = -1
	{
		selected = path_get_number(path);
		if selected = 0
		dp = 100;
		else
		dp = path_get_point_speed(path,selected-1);
		path_add_point(path, round(mouse_x/gap)*gap, round(mouse_y/gap)*gap, dp);
	}
	dragging = selected;
}

//Dragging points
if dragging != -1
{
	path_change_point(path, dragging, round(mouse_x/gap)*gap, 
		round(mouse_y/gap)*gap, path_get_point_speed(path,dragging));
}

//Check for changes
if path_points < 0
{
	changed = 0;
	path_points = path_get_number(path);
	for(i=0;i<path_points;i++)
	{
		path_x[i] = path_get_point_x(path,i);
		path_y[i] = path_get_point_y(path,i);
		path_spd[i] = path_get_point_speed(path,i);
	}
}

if changed == 0
{
	if path_get_number(path) != path_points
	{
		changed = 1;
		window_set_caption(filename + "* - " + title);
	}
	else
	{
		for(i=0;i<path_points;i++)
		{
			if path_x[i] != path_get_point_x(path,i)
			or path_y[i] != path_get_point_y(path,i)
			or path_spd[i] != path_get_point_speed(path,i)
			{
				changed = 1;
				window_set_caption(filename + "* - " + title);
			}
		}
	}
}

//Get sizebar button press
btn_pressed = 0;
if mouse_check_button_pressed(mb_left) 
and window_mouse_get_x() >= hud_left+btn_offset 
and window_mouse_get_x() < hud_right-btn_offset
{
	for(i=1;i<=btn_count;i+=1)
	{
		if window_mouse_get_y() >= btn_up[i] and window_mouse_get_y() < btn_down[i]
		{
			btn_pressed = i;
			break;
		}
	}
}

//Moving around
if mouse_check_button(mb_right)
{
	camera_set_view_pos(view_camera[0],
		camera_get_view_x(view_camera[0]) - (mouse_x - mouse_last_x),
		camera_get_view_y(view_camera[0]) - (mouse_y - mouse_last_y))
}
if mouse_wheel_up() or keyboard_check_pressed(vk_add)
{
	zoom /= 1.1;
}
if mouse_wheel_down() or keyboard_check_pressed(vk_subtract)
{
	zoom *= 1.1;
}

//Functions
if (btn_pressed == 5 or keyboard_check_pressed(vk_delete)) and selected > -1
{
	path_delete_point(path,selected);
	selected -= 1;
}
else if (btn_pressed == 6 or keyboard_check_pressed(vk_insert)) and selected > 0
{
	path_insert_point(path, selected, 
	round((path_get_point_x(path,selected-1)
		+path_get_point_x(path,selected))/2/gap)*gap,
	round((path_get_point_y(path,selected-1)
		+path_get_point_y(path,selected))/2/gap)*gap,
	path_get_point_speed(path,selected));
}
else if keyboard_check_pressed(vk_pagedown) and selected > 0
{
	selected -= 1;
}
else if keyboard_check_pressed(vk_pageup) and selected > -1 and 
	selected < path_get_number(path)
{
	selected += 1;
}
else if keyboard_check_pressed(vk_home) and path_get_number(path) > 0
{
	selected = 0;
}
else if keyboard_check_pressed(vk_end)
{
	selected = path_get_number(path)-1;
}
else if keyboard_check_pressed(vk_f3)
{
	debug = 1 - debug;
}
else if keyboard_check_pressed(vk_up)
{
	if keyboard_check(vk_shift)
	{
		for (i=0; i<path_get_number(path); i++)
		{
			path_change_point(path,i,
				path_get_point_x(path,i),
				path_get_point_y(path,i)-gap,
				path_get_point_speed(path,i));
		}
		
	}
	else if selected > -1
	path_change_point(path,selected,
		path_get_point_x(path,selected),
		path_get_point_y(path,selected)-gap,
		path_get_point_speed(path,selected));
}
else if keyboard_check_pressed(vk_right)
{
	if keyboard_check(vk_shift)
	{
		for (i=0; i<path_get_number(path); i++)
		{
			path_change_point(path,i,
				path_get_point_x(path,i)+gap,
				path_get_point_y(path,i),
				path_get_point_speed(path,i));
		}
		
	}
	else if selected > -1
	path_change_point(path,selected,
		path_get_point_x(path,selected)+gap,
		path_get_point_y(path,selected),
		path_get_point_speed(path,selected));
}
else if keyboard_check_pressed(vk_down)
{
	if keyboard_check(vk_shift)
	{
		for (i=0; i<path_get_number(path); i++)
		{
			path_change_point(path,i,
				path_get_point_x(path,i),
				path_get_point_y(path,i)+gap,
				path_get_point_speed(path,i));
		}
		
	}
	else if selected > -1
	path_change_point(path,selected,
		path_get_point_x(path,selected),
		path_get_point_y(path,selected)+gap,
		path_get_point_speed(path,selected));
}
else if keyboard_check_pressed(vk_left)
{
	if keyboard_check(vk_shift)
	{
		for (i=0; i<path_get_number(path); i++)
		{
			path_change_point(path,i,
				path_get_point_x(path,i)-gap,
				path_get_point_y(path,i),
				path_get_point_speed(path,i));
		}
		
	}
	else if selected > -1
	path_change_point(path,selected,
		path_get_point_x(path,selected)-gap,
		path_get_point_y(path,selected),
		path_get_point_speed(path,selected));
}
else if btn_pressed == 1 or keyboard_check_pressed(ord("N"))
{
	if changed
	{
		show_question_async("Reset the path? Unsaved changes will be lost");
		question = 1;
	}
	else
	newfile = 1;
}
else if btn_pressed == 2 or keyboard_check_pressed(ord("O"))
{
	if changed
	{
		show_question_async("Replace the path? Unsaved changes will be lost");
		question = 2;
	}
	else
	openfile = 1;
}
else if btn_pressed == 3 or keyboard_check_pressed(ord("S"))
{
	if path_get_length(path) > 0
	{
		fp = get_save_filename("Text|*.txt",filepath)
		if fp != ""
		{
			txt = file_text_open_write(fp)
			i = path;
			j = 0;
			while j < path_get_number(i)
			{
				ix = path_get_point_x(i,j);
				iy = path_get_point_y(i,j);
				spd = path_get_point_speed(i,j);
				file_text_write_real(txt,ix);
				file_text_write_real(txt,iy);
				file_text_write_real(txt,spd);
				file_text_writeln(txt);
				j+=1;
			}
			file_text_close(txt);
			path_points = -1;
			filepath = fp;
			filename = filename_name(filepath);
			window_set_caption(filename + " - " + title);
			show_message_async("Path saved successfully");
		}
	}
	else
	show_message_async("Please create a path first");
}
else if btn_pressed == 4
{
	sprite_delete(background);
	fp = get_open_filename("PNG Image|*.png","");
	if fp != ""
	{
		file = sprite_add(fp,1,0,0,0,0);
		if sprite_exists(file)
		{
			background = file;
			if bg_view < 1
			bg_view = 1;
		}
		else
		show_message_async("Could not load background");
	}
}
else if btn_pressed == 7
{
	if selected > -1
	{
		if path_get_point_speed(path,selected) > 50
		path_change_point(path,selected,
			path_get_point_x(path,selected),
			path_get_point_y(path,selected),0);
		else path_change_point(path,selected,
			path_get_point_x(path,selected),
			path_get_point_y(path,selected),100);
	}
}
else if btn_pressed == 8
{
	grid_select = 1 - grid_select;
}
else if btn_pressed == 9
{
	path_reverse(path);
}
else if btn_pressed == 10
{
	for (i = 0; i <= path_get_number(path); i++)
	path_change_point(path,i, 1024 - path_get_point_x(path,i), 
		path_get_point_y(path,i),path_get_point_speed(path,i))
}
else if btn_pressed == 11
{
	for (i = 0; i <= path_get_number(path); i++)
	path_change_point(path,i, path_get_point_x(path,i), 
		576 - path_get_point_y(path,i),path_get_point_speed(path,i))
}
else if btn_pressed == 12
{
	bg_view += 1;
	if bg_view == 5
	bg_view = 0;
}
else if btn_pressed == 13
{
	preview = 1 - preview;
}
else if btn_pressed == 14
{
	camera_set_view_pos(view_camera[0],-64,-64);
	zoom = 1;
}
else if btn_pressed == 15
{
	debug = 1 - debug;
}
else if keyboard_check_pressed(ord("C"))
{
	if path_get_length(path) > 0
	{
		txt = "";
		j = 0;
		while j < path_get_number(path)
		{
			ix = string(path_get_point_x(path,j));
			iy = string(path_get_point_y(path,j));
			spd = string(path_get_point_speed(path,j));
			txt += ix+" "+iy+" "+spd+"\n";
			j+=1;
		}
		clipboard_set_text(txt);
		show_message_async("Path copied to clipboard");
		
	}
	else
	show_message_async("Please create a path first");
}
else if keyboard_check_pressed(ord("V"))
{
	fp = temp_directory + "cache.txt";
	file = file_text_open_write(fp);
	file_text_write_string(file,clipboard_get_text());
	file_text_close(file);
	
	file = file_text_open_read(fp);
	path_temp = path_add();
	while !file_text_eof(file)
	{
		ix = file_text_read_real(file);
		iy = file_text_read_real(file);
		spd = file_text_read_real(file);
		if spd > 50
		spd = 100;
		else
		spd = 0;
		path_add_point(path_temp,ix,iy,spd);
		file_text_readln(file);
	}
	file_text_close(file);
	path_set_closed(path_temp,false);
	path_set_kind(path_temp,1);
	path_set_precision(path_temp,8);
	if path_get_length(path_temp) != 0
	{
		if changed
		{
			show_question_async("Path found in clipboard. Load the path?"
				+ "\nUnsaved changes will be lost");
			question = 3;
		}
		else
		pastefile = 1;
	}
	else
	show_message_async("Error loading path from clipboard");
}
else if keyboard_check_pressed(ord("I"))
{
	show_question_async("Import legacy path and replace the current one?"
		+"\nUnsaved changes will be lost");
	question = 4;
}
else if keyboard_check_pressed(vk_f12)
{
	camera_set_view_pos(view_camera[0],-64,-64);
	zoom = 1;
}

if mouse_check_button_pressed(mb_left) and btn_pressed != 8
{
	grid_select = 0;
}

if mouse_check_button_released(mb_left)
dragging = -1;

//Confirmation
if newfile
{
	newfile = 0;
	path_delete(path);
	path = path_add();
	if sprite_exists(background)
	sprite_delete(background);
	selected = -1;
	dragging = -1;
	path_set_closed(path,0);
	path_set_kind(path,1);
	path_set_precision(path,8);
	camera_set_view_pos(view_camera[0],-64,-64);
	zoom = 1;
	path_points = -1;
	filename = "unnamed";
	filepath = filename;
	window_set_caption(filename + " - " + title);
}
if openfile
{
	openfile = 0;
	fp = get_open_filename("Text|*.txt","");
	if fp != ""
	{
		file = file_text_open_read(fp);
		path_temp = path_add();
		while !file_text_eof(file)
		{
			ix = file_text_read_real(file);
			iy = file_text_read_real(file);
			spd = file_text_read_real(file);
			if spd > 50
			spd = 100;
			else
			spd = 0;
			path_add_point(path_temp,ix,iy,spd);
			file_text_readln(file);
		}
		file_text_close(file);
		path_set_closed(path_temp,false);
		path_set_kind(path_temp,1);
		path_set_precision(path_temp,8);
		if path_get_length(path_temp) != 0
		{
			path = path_temp;
			selected = -1;
			dragging = -1;
			filepath = fp;
			filename = filename_name(filepath);
			window_set_caption(filename + " - " + title);
			changed = 0;
			path_points = -1;
			camera_set_view_pos(view_camera[0],-64,-64);
			zoom = 1;
		}
		else
		show_message_async("Error loading path");
	}
}
if import
{
	import = 0;
	fp = get_open_filename("INI files|*.ini","");
	if fp != ""
	{
		ini_open(fp);
		path_temp = path_add();
		i = 0;
		while ini_key_exists("Points","x"+string(i)) 
		and ini_key_exists("Points","y"+string(i))
		{
			ix = ini_read_real("Points","x"+string(i),0);
			iy = ini_read_real("Points","y"+string(i),0);
			spd = 100;
			path_add_point(path_temp,ix,iy,spd);
			i += 1;
		}
		ini_close();
		path_set_closed(path_temp,false);
		path_set_kind(path_temp,1);
		path_set_precision(path_temp,8);
		if path_get_length(path_temp) != 0
		{
			path = path_temp;
			selected = -1;
			dragging = -1;
			filepath = filename_change_ext(fp,".txt");
			filename = filename_name(filepath);
			window_set_caption(filename + " - " + title);
			changed = 0;
			path_points = -1;
			camera_set_view_pos(view_camera[0],-64,-64);
			zoom = 1;
		}
		else
		show_message_async("Error loading path");
	}
}
if pastefile
{
	pastefile = 0;
	path = path_temp;
	selected = -1;
	dragging = -1;
	filename = "unnamed";
	filepath = filename;
	window_set_caption(filename + " - " + title);
	changed = 0;
	path_points = -1;
}
	

//Grid size
if grid_select and keyboard_check_pressed(vk_anykey)
{
	if keyboard_check_pressed(vk_backspace)
	gap_text = floor(gap_text/10);
	else if gap_text < 100000000
	{
		gap_text = string(gap_text);
		gap_text += keyboard_lastchar;
		gap_text = real(string_digits(gap_text));
		keyboard_lastchar = "";
	}
	
	if gap_text == 0
	gap = 1;
	else
	gap = gap_text;
}

//Window size
width = window_get_width();
height = window_get_height();
camera_set_view_size(view_camera[0], width*zoom, height*zoom);
		
display_set_gui_size(width,height);

mouse_last_x = mouse_x;
mouse_last_y = mouse_y;