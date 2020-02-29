/// @description Insert description here
// You can write your code in this editor

image_blend = human ? c_aqua : c_red;
turn_timer = human ? 0 : turn_timer;

if (keyboard_check(vk_left) and human) or (turn_timer < 0 and !human)
	{
	image_angle = (image_angle + omega) % 360.0;
	turn_timer += 1;
	if (abs(turn_timer) < 1){turn_timer = 0;}
	}
if (keyboard_check(vk_right) and human) or (turn_timer > 0 and !human)
	{
	image_angle = (image_angle - omega) % 360.0;
	turn_timer -= 1;
	if (abs(turn_timer) < 1){turn_timer = 0;}
	}
if (keyboard_check(vk_up) and human) or (turn_timer == 0 and !human and !collision_line(x, y, x + vision*cos(image_angle*pi/180.0), y - vision*sin(image_angle*pi/180.0), obj_block, true, true))
	{
	new_x = x + cos(image_angle * pi / 180.0) * sp;
	new_y = y - sin(image_angle * pi / 180.0) * sp;
	if place_free(new_x, new_y){x = new_x; y = new_y;}
	else if !human {turn_timer = random_range(round(room_speed * 0.25), round(room_speed * 0.75)) * choose(1, -1);}
	}
if (keyboard_check(vk_down) and human)
	{
	new_x = x - cos(image_angle * pi / 180.0) * sp;
	new_y = y + sin(image_angle * pi / 180.0) * sp;
	if place_free(new_x, new_y){x = new_x; y = new_y;}
	}
if (!human and turn_timer == 0 and collision_line(x, y, x + vision*cos(image_angle*pi/180.0), y - vision*sin(image_angle*pi/180.0), obj_block, true, true))
	{
	turn_timer = random_range(int64(room_speed * 0.25), int64(room_speed * 0.75)) * choose(1, -1);
	}

if keyboard_check_pressed(ord("T"))
	if human
		{human = false;}
	else
		{human = true;}