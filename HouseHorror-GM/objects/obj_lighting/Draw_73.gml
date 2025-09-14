/// @description Drawing after everything else

var torch_flicker = irandom_range(0, sprite_get_number(spr_lightsheet) - 1); 


// Create surface
if(!surface_exists(surface_light))
{
    surface_light = surface_create(room_width, room_height);
}

// Set target to our light surface
surface_set_target(surface_light);
draw_clear_alpha(c_black, 0.9); // Fill screen with black color

// Set blending mode
gpu_set_blendmode(bm_subtract);

// Draw light for torch holder
with (obj_player)
{
    var player_light_radius = 1.2;
    draw_sprite_ext(spr_lightsheet, torch_flicker, x, y, player_light_radius, player_light_radius, 0, c_white, 1);
}

with (obj_torch)
{
    var torch_radius = 1.5;
    draw_sprite_ext(spr_lightsheet, torch_flicker, x, y, torch_radius, torch_radius, 0, c_white, 1);
}

// Resetting blend mode
gpu_set_blendmode(bm_normal);


// Reset surface
surface_reset_target();

// Draw surface onto screen
draw_surface(surface_light, 0, 0);

