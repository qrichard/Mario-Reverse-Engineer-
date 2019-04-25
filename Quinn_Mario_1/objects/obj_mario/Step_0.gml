#region //MOVEMENT(GET PLAYERS INPUT)
	//SET HSPEED
		hspeed = (keyboard_check(vk_right) - keyboard_check(vk_left)) * walk_speed
	
	//CHECK IF ON GROUND THIS FRAME
		on_ground = check_box_collision(obj_gui.collision_map, obj_gui.jumpthru_map, 0, 1);
	
	//SET NORMAL WALK SPEED
		walk_speed = 1.2;
		
		
			if hspeed != 0 then {               
        image_xscale = sign(hspeed);          //SET FAFING DIRECTION
         if on_ground then image_speed = .125; //SET ANIMATION SPEED
         }
		
		
	//CREATE RUN AND SET RUN SPEED
		if keyboard_check(ord("D")) && direction < 180  then
		{
		hspeed += run_speed;
		}
		if keyboard_check (ord("D")) && direction >= 180 then
		{
		hspeed -= run_speed;
		}
		

	


#endregion

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

#region JUMPING/GRAVITY

    //THIS CODE MAKES ME FALL IF IM NOT IN THE GROUND

      if not on_ground then {    

          gravity = gravity_speed;

         // sprite_index = spr_baby_mario_jump;

      }//end if

  

  //IF I AM ON THE GROUND AND I PUSHED SPACEBAR = JUMP

      if on_ground  &&   keyboard_check_pressed(vk_space) then {

              vspeed = 1.2 * -jump_speed;

          }

#endregion

#region ANIMATIONS
//walking animation
if   (on_ground == true && hspeed > 0 || hspeed < 0)  
{
	image_speed = .6
	sprite_index = spr_mario_walk;
}else 
{
sprite_index = spr_mario_idle;
}

#endregion