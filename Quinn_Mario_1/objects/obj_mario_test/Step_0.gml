//Main Actions

#region// CHECK FOR INPUTS & Allow Player Movement


up = keyboard_check(vk_up)
down = keyboard_check(vk_down)
right =keyboard_check(vk_right)
left =  -keyboard_check(vk_left)
start = keyboard_check(vk_enter)
select = keyboard_check(vk_shift)
a =keyboard_check(ord("F"))
b =keyboard_check(ord("D"))

//DECELERATE
//if((!right) && (!left))
//{
//	hsp = lerp(hsp, 0, acc*1.5);
//	if (hsp <.09) && (hsp > -.09)
//	{
//		hsp = 0
//	}
//}

move = left + right;

//Move Right
if (move ==1)
{
	hsp += acc;
	if(hsp >= maxSpeed) hsp = maxSpeed;
}
else if (hsp >0)
{
 hsp -= acc;
 if (hsp <= 0) hsp =0
}

//Move Left
if (move == -1)
{
	hsp -= acc;
	if(hsp <= -maxSpeed) hsp = -maxSpeed;
}
else if (hsp <0)
{
 hsp += acc;
 if (hsp >= 0) hsp =0
}
#endregion


#region
switch(state)
{
	case("IDLE"):
	{
		last_state = "IDLE"
		sprite_index = spr_mario_idle
		image_speed = 0;
		
		//Check inputs
		if(a) state = "Jumping"
		if (right) state = "Right"
		if(left) state = "Left"
		
		break;
	}
		case("Right"):
	{
		
		
		
		
		last_state = "Right"
		sprite_index = spr_mario_walk
		image_xscale = 1;
		#region// CHECK FOR INPUTS & Allow Player Movement


up = keyboard_check(vk_up)
down = keyboard_check(vk_down)
right =keyboard_check(vk_right)
left =  -keyboard_check(vk_left)
start = keyboard_check(vk_enter)
select = keyboard_check(vk_shift)
a =keyboard_check(ord("F"))
b =keyboard_check(ord("D"))

//DECELERATE
//if((!right) && (!left))
//{
//	hsp = lerp(hsp, 0, acc*1.5);
//	if (hsp <.09) && (hsp > -.09)
//	{
//		hsp = 0
//	}
//}

move = left + right;

//Move Right
if (move ==1)
{
	hsp += acc;
	if(hsp >= maxSpeed) hsp = maxSpeed;
}
else if (hsp >0)
{
 hsp -= acc;
 if (hsp <= 0) hsp =0
}

//Move Left
if (move == -1)
{
	hsp -= acc;
	if(hsp <= -maxSpeed) hsp = -maxSpeed;
}
else if (hsp <0)
{
 hsp += acc;
 if (hsp >= 0) hsp =0
}
#endregion
		break;
	}
		case("Left"):
	{
		break;
	}
		case("JUMPING"):
	{
		sprite_index = spr_mario_jump;
		image_speed = 0;
		
		//Jumping
		if(vsp < 5) vsp += grav; //Gravity

#region// CHECK FOR INPUTS & Allow Player Movement


up = keyboard_check(vk_up)
down = keyboard_check(vk_down)
right =keyboard_check(vk_right)
left =  -keyboard_check(vk_left)
start = keyboard_check(vk_enter)
select = keyboard_check(vk_shift)
a =keyboard_check(ord("F"))
b =keyboard_check(ord("D"))

//DECELERATE
//if((!right) && (!left))
//{
//	hsp = lerp(hsp, 0, acc*1.5);
//	if (hsp <.09) && (hsp > -.09)
//	{
//		hsp = 0
//	}
//}

move = left + right;

//Move Right
if (move ==1)
{
	hsp += acc;
	if(hsp >= maxSpeed) hsp = maxSpeed;
}
else if (hsp >0)
{
 hsp -= acc;
 if (hsp <= 0) hsp =0
}

//Move Left
if (move == -1)
{
	hsp -= acc;
	if(hsp <= -maxSpeed) hsp = -maxSpeed;
}
else if (hsp <0)
{
 hsp += acc;
 if (hsp >= 0) hsp =0
}
#endregion
		if (a) 
		{
			jumpTime ++;
			if (jumpTime < 8) vsp = -jumpSpeed;
		}
		else jumpTime = 20;
		
		if(place_meeting(x,y+1, obj_wall)) 
		{
		jumpTime = 0
		state = last_state;
		}
		

		
		break;
	}
}

#endregion

#region//Collision


//Horizontal
if place_meeting(x + hsp,y, obj_wall)
{
		while(!place_meeting(x + sign(hsp),y , obj_wall))
		{
			x += sign (hsp)
		}
		hsp = 0;
}
x += hsp


//Verticle 
if place_meeting(x,y+vsp, obj_wall)
{
		while(!place_meeting(x,y + sign(vsp), obj_wall))
		{
			y += sign (vsp)
		}
		vsp = 0;
}

y += vsp


#endregion COLLISION