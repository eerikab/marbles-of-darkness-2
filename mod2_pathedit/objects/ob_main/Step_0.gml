/// @description Insert description here
// You can write your code in this editor

//Dragging points
if dragging != -1
{
	path_change_point(path, dragging, round(mouse_x/gap)*gap, 
		round(mouse_y/gap)*gap, path_get_point_speed(path,dragging));
}

//Selecting points
if mouse_check_button_pressed(mb_left) and window_mouse_get_x() < hud_left
{
	selected = -1;
	for (i = 0; i < path_get_number(path); i++)
	{
		if point_distance(mouse_x, mouse_y, path_get_point_x(path,i), path_get_point_y(path,i)) < 16
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

//Sidebar buttons
if mouse_check_button_pressed(mb_left) 
and window_mouse_get_x() >= hud_left+16 and window_mouse_get_x() <= hud_right-16
{
	if window_mouse_get_y() >= 64 and window_mouse_get_y() <= 96
	{
		keyboard_key_press(ord("O"));
	}
	else if window_mouse_get_y() >= 112 and window_mouse_get_y() <= 144
	{
		keyboard_key_press(ord("S"));
	}
	else if window_mouse_get_y() >= 160 and window_mouse_get_y() <= 192
	{
		sprite_delete(background);
		fp = get_open_filename("PNG Image|*.png","");
		if fp != ""
		{
			file = sprite_add(fp,1,0,0,0,0);
			if sprite_exists(file)
			background = file;
			else
			show_message_async("Could not load background");
		}
	}
	else if window_mouse_get_y() >= 256 and window_mouse_get_y() <= 288
	{
		keyboard_key_press(vk_delete);
	}
	else if window_mouse_get_y() >= 304 and window_mouse_get_y() <= 336
	{
		keyboard_key_press(vk_insert);
	}
	else if window_mouse_get_y() >= 352 and window_mouse_get_y() <= 384
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
	else if window_mouse_get_y() >= 448 and window_mouse_get_y() <= 480
	{
		grid_select = 1 - grid_select;
	}
	else if window_mouse_get_y() >= 496 and window_mouse_get_y() <= 528
	{
		preview = 1 - preview;
	}
	else if window_mouse_get_y() >= 544 and window_mouse_get_y() <= 576
	{
		camera_set_view_pos(view_camera[0],-64,-64);
		zoom = 1;
	}
	else if window_mouse_get_y() >= 592 and window_mouse_get_y() <= 624
	{
		debug = 1 - debug;
	}
	
	if window_mouse_get_y() < 448 or window_mouse_get_y() > 480
	grid_select = 0;
}
else if mouse_check_button_pressed(mb_left) 
{
	grid_select = 0;
}

if mouse_check_button_released(mb_left)
dragging = -1;

//Moving around
if mouse_check_button(mb_right)
{
	camera_set_view_pos(view_camera[0],
		camera_get_view_x(view_camera[0]) - (mouse_x - mouse_last_x),
		camera_get_view_y(view_camera[0]) - (mouse_y - mouse_last_y))
}
if mouse_wheel_up()
{
	zoom /= 1.1;
}
if mouse_wheel_down()
{
	zoom *= 1.1;
}


//Keyboard navigation
if keyboard_check_pressed(vk_delete) and selected > -1
{
	path_delete_point(path,selected);
	selected -= 1;
	keyboard_key_release(vk_delete);
}

if keyboard_check_pressed(vk_insert) and selected > 0
{
	path_insert_point(path, selected, 
	round((path_get_point_x(path,selected-1)+path_get_point_x(path,selected))/2/gap)*gap,
	round((path_get_point_y(path,selected-1)+path_get_point_y(path,selected))/2/gap)*gap,
	path_get_point_speed(path,selected));
	keyboard_key_release(vk_insert);
}

if keyboard_check_pressed(vk_pagedown) and selected > 0
{
	selected -= 1;
}
if keyboard_check_pressed(vk_pageup) and selected > -1 and selected < path_get_number(path)
{
	selected += 1;
}
if keyboard_check_pressed(vk_home) and path_get_number(path) > 0
{
	selected = 0;
}
if keyboard_check_pressed(vk_end)
{
	selected = path_get_number(path)-1;
}
if keyboard_check_pressed(vk_f3)
{
	debug = 1 - debug;
}
if keyboard_check_pressed(vk_up) and selected > -1
{
	path_change_point(path,selected,
		path_get_point_x(path,selected),
		path_get_point_y(path,selected)-gap,
		path_get_point_speed(path,selected));
}
if keyboard_check_pressed(vk_right) and selected > -1
{
	path_change_point(path,selected,
		path_get_point_x(path,selected)+gap,
		path_get_point_y(path,selected),
		path_get_point_speed(path,selected));
}
if keyboard_check_pressed(vk_down) and selected > -1
{
	path_change_point(path,selected,
		path_get_point_x(path,selected),
		path_get_point_y(path,selected)+gap,
		path_get_point_speed(path,selected));
}
if keyboard_check_pressed(vk_left) and selected > -1
{
	path_change_point(path,selected,
		path_get_point_x(path,selected)-gap,
		path_get_point_y(path,selected),
		path_get_point_speed(path,selected));
}
if keyboard_check_pressed(ord("O"))
{
	keyboard_key_release(ord("O"));
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
			filename = fp;
		}
		else
		show_message_async("Error loading path");
	}
}
if keyboard_check_pressed(ord("S"))
{
	keyboard_key_release(ord("S"));
	if path_get_length(path) > 0
	{
		fp = get_save_filename("Text|*.txt",filename)
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
			show_message_async("Path saved successfully");
		}
	}
	else
	show_message_async("Please create a path first");
}
if keyboard_check_pressed(ord("C"))
{
	keyboard_key_release(ord("C"));
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