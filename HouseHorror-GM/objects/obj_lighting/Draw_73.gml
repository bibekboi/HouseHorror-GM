/// @description Drawing after everything else

// Create surface
if(!surface_exists(surface_light))
{
    surface_light = surface_create(room_width, room_height);
}

// Set target to our light surface
surface_set_target(surface_light);
draw_clear_alpha(c_black, 1); // Fill screen with black color


// Draw light for torch holder
var torch_radius = 2;

gpu_set_blendmode(bm_subtract);
draw_sprite_ext(spr_lightsheet, image_index / 30, obj_player.x, obj_player.y, torch_radius, torch_radius, 0, c_white, 1);
gpu_set_blendmode(bm_normal);


// Reset surface
surface_reset_target();

// Draw surface onto screen
draw_surface(surface_light, 0, 0);

