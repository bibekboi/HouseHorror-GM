///@description Setup properties

view_enabled = true; // mimics enable viewport
view_visible[0] = true; // access 0th element in viewport

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 320;
view_hport[0] = 180;

view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, 32, 32);