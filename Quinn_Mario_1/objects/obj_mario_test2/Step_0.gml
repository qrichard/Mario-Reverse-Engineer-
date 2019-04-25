var bbox_side;

key_right = keyboard_check(vk_right)
key_left = keyboard_check(vk_left)
key_up = keyboard_check(vk_up)
key_down = keyboard_check(vk_down)

hsp = (key_right - key_left) * 1
vsp = (key_down - key_up) * 1

vsp = vsp + gravity

//Horizontal Collision
if(hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
if (tilemap_get_at_pixel(obj_gui.collision_map, bbox_side + hsp, bbox_top) != 0) || (tilemap_get_at_pixel(obj_gui.collision_map, bbox_side + hsp, bbox_bottom) != 0)
{
   if (hsp > 0) x = x - (x mod 16) +15 - (bbox_right - x);
   else x=x - (x mod 16) - (bbox_left - x);
   hsp = 0
}
x += hsp;

//Vertical Collision

if(vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
if (tilemap_get_at_pixel(obj_gui.collision_map, bbox_left, bbox_side + vsp) != 0) || (tilemap_get_at_pixel(obj_gui.collision_map,  bbox_right, bbox_side + vsp) != 0)
{
   if (vsp > 0)then
   {
	   y = y - (y mod 16) +15 - (bbox_bottom - y)

   }
   else y=y - (y mod 16) - (bbox_top - y);
   vsp = 0
}

y += vsp;