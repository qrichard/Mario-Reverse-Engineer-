//CREATE NEW RUNTIME FONT RESOURCE
	global.FntNew = -1;

	var MapString = "";
	for (var IntChr = 32; IntChr < 32 + sprite_get_number(spr_font); IntChr += 1){
	        MapString += chr(IntChr);
	}//next IntChr
    
	global.FntNew = font_add_sprite_ext(spr_font, MapString, false, 0);
	draw_set_font(global.FntNew);

//SET DEFAULT GAME SPEED
	game_set_speed(60, gamespeed_fps);

//SET DEFAULT WINDOW SIZE
	window_set_size(256*2  ,240*2 );

//CREATE GUI OBJECT
	instance_create_depth(0,0,-4096, obj_gui);

room_goto_next()