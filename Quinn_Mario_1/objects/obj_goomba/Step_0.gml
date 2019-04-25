

#region HORIZONTAL COLLISION CHECK (LOOK AHEAD)
	if check_box_collision(obj_gui.collision_map, obj_gui.jumpthru_map, hspeed, 0) then {
		//REMOVE X FRACTION
			x = floor(x);
		
		//MOVE CLOSER UNTIL TOUCHING WALL
			while not check_box_collision(obj_gui.collision_map, obj_gui.jumpthru_map,  sign(hspeed), 0) {
				x += sign(hspeed);
			}//end while
	
		//STOP HSPEED
			hspeed = 0;	
	}//end if
#endregion

#region VERTICAL COLLISION CHECK (LOOK AHEAD)
	if check_box_collision(obj_gui.collision_map, obj_gui.jumpthru_map,  0, vspeed + sign(vspeed)) then {
		//REMOVE Y FRACTION
			y = floor(y);
	
		//MOVE CLOSER UNTIL TOUCHING WALL
			while not check_box_collision(obj_gui.collision_map, obj_gui.jumpthru_map, 0, sign(vspeed)){
				y += sign(vspeed);		
			}//end if 
			
		//STOP VSPEED & GRAVITY
			vspeed = 0;	
			gravity = 0;
	}//end if
#endregion