/// @description Insert description here
// You can write your code in this editor

hud_left = window_get_width()-hud_width;
hud_right = window_get_width();
hud_mid = (hud_left+hud_right)/2;

draw_rectangle_color(hud_left, 0, hud_right, window_get_height(),
	c_dkgray,c_dkgray,c_gray,c_gray,false);

//Buttons
draw_set_color(c_black);

for(i=1;i<=btn_count;i+=1)
{
	draw_rectangle(hud_left+btn_offset,
		btn_up[i],
		hud_right-btn_offset,
		btn_down[i],false);
}

//Button highlight
draw_set_color(c_white)
draw_set_alpha(0.20);

if window_mouse_get_x() >= hud_left+btn_offset 
and window_mouse_get_x() < hud_right-btn_offset
{
	for(i=1;i<=btn_count;i+=1)
	{
		if window_mouse_get_y() >= btn_up[i] and window_mouse_get_y() < btn_down[i]
		and selected >= btn_req[i]
		draw_rectangle(hud_left+btn_offset,btn_up[i],
			hud_right-btn_offset,btn_down[i],false);
	}
}
draw_set_alpha(1);

if grid_select
draw_rectangle(hud_left+btn_offset,btn_up[8],hud_right-btn_offset,btn_down[8],true);

//Text
for(i=1;i<=btn_count;i+=1)
{
	if btn_req[i] > selected
	draw_set_color(c_gray);
	else
	draw_set_color(c_white);
	
	txt = btn_text[i]
	if txt == "Grid"
	{
		if grid_select
		txt += ": "+string(gap_text)+"|";
		else
		txt += ": "+string(gap_text);
	}
	if txt == "Depth" and selected >= 0
	{
		if path_get_point_speed(path,selected) > 50
		txt += ": above";
		else
		txt += ": below";
	}
	if txt == "Preview"
	{
		if preview
		txt += ": On";
		else
		txt += ": Off";
	}
	if txt == "BG view"
	{
		if bg_view == 0
		txt += ": Off";
		else if bg_view == 1
		txt += ": Corner";
		else if bg_view == 2
		txt += ": Fill";
		else if bg_view == 3
		txt += ": Center";
		else if bg_view == 4
		txt += ": Fit";
	}
	if txt == "Statistics"
	{
		if debug
		txt += ": On";
		else
		txt += ": Off";
	}
	draw_text(hud_mid,btn_pos[i],txt)
}
draw_text(hud_mid,btn_pos[1]-btn_size,"Files");
draw_text(hud_mid,btn_pos[5]-btn_size,"Point");
draw_text(hud_mid,btn_pos[8]-btn_size,"Path");
draw_text(hud_mid,btn_pos[12]-btn_size,"Editor");

if debug and !preview
draw_text(96,192,"Points: " + string(path_get_number(path)) +
	"\nLength: " + string(path_get_length(path)) +
	"\nSelected: " + string(selected+1) +
	"\nDragging: " + string(dragging+1) +
	"\n\nPoint X: " + string(path_get_point_x(path,selected)) +
	"\nPoint Y: " + string(path_get_point_y(path,selected)) +
	"\n\nView X: " + string(camera_get_view_x(view_camera[0])) +
	"\nView Y: " + string(camera_get_view_y(view_camera[0])) +
	"\nZoom: " + string(zoom) +
	"\n\nWidth: " + string(window_get_width()) +
	"\nHeight: " + string(window_get_height())
);

if keyboard_check_pressed(vk_f12)
{
	date = "Screenshot "+date_datetime_string(date_current_datetime())
	date = string_replace_all(date,":","-");
	date = string_replace_all(date,".","-");
	date += ".png"
	fp = get_save_filename("PNG|.png",date)
	if fp != ""
	screen_save_part(fp,64,64,1024,576);
}