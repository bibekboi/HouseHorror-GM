/// @description Player step

var move_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var move_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var move_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

// Movement calculation
var h_movement = move_right - move_left;
var v_movement = move_down - move_up;

// Normalize movement
if(h_movement != 0 || v_movement != 0)
{
    var player_speed = 2; 
    var player_direction = point_direction(0, 0, h_movement, v_movement);
    var x_movement_add = lengthdir_x(player_speed, player_direction);
    var y_movement_add = lengthdir_y(player_speed, player_direction); 
    
    x = x + x_movement_add;
    y = y + y_movement_add;
}