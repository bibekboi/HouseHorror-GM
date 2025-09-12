/// @description Player step

var player_speed = 2; 
var camera_lerp_smooth_speed = 0.06;

var move_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var move_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var move_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

// Movement calculation
var h_movement = move_right - move_left;
var v_movement = move_down - move_up;

// Camera mobility
var x_view = camera_get_view_x(view_camera[0]);
var y_view = camera_get_view_y(view_camera[0]);
var w_view = camera_get_view_width(view_camera[0]);
var h_view = camera_get_view_height(view_camera[0]); 

var go_to_x = x + (h_movement * player_speed) - (w_view * 0.5);
var go_to_y = y + (v_movement * player_speed) - (h_view * 0.5);

var new_x = lerp(x_view, go_to_x, camera_lerp_smooth_speed);
var new_y = lerp(y_view, go_to_y, camera_lerp_smooth_speed); 

// Normalize movement
if(h_movement != 0 || v_movement != 0)
{
    var player_direction = point_direction(0, 0, h_movement, v_movement);
    var x_movement_add = lengthdir_x(player_speed, player_direction);
    var y_movement_add = lengthdir_y(player_speed, player_direction); 
    
    x = x + x_movement_add;
    y = y + y_movement_add;
}

// Set camera movement
camera_set_view_pos(view_camera[0], new_x, new_y);