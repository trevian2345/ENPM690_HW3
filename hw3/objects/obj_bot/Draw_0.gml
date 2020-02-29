/// @description Insert description here
// You can write your code in this editor

help_text= "Use <left> and <right> to turn.\nUse <up> to move forward and <down> to reverse.\nUse <T> to toggle between human and robot.";
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_rectangle_color(0, 0, 64*8, 64*2, c_silver, c_silver, c_silver, c_silver, false);
draw_text_color(20, 30, help_text, c_maroon, c_maroon, c_maroon, c_maroon, 1);

if (!human)
	{
	draw_primitive_begin(pr_linestrip)
	draw_vertex_color(x, y, c_red, 1.0)
	draw_vertex_color(x + 64*cos(image_angle * pi / 180.0), y - 64*sin(image_angle * pi / 180.0), c_red, 1.0)
	draw_vertex_color(x + vision*cos(image_angle * pi / 180.0), y - vision*sin(image_angle * pi / 180.0), c_red, 0.0)
	draw_primitive_end()
	}
draw_self()