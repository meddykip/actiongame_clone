// to cap the horizontal movement speed (note that this is deliberately a different method 

x_vel = x_vel < 0 ? max(x_vel, -x_vel_max) : min(x_vel, x_vel_max);

// Apply gravity (accelerate the player down)
y_vel += grav;

// Our players use acceleration, we will often have velocities with fractional values,
// but Game Maker doesn't like decimals for position values, so we round here.
x_move = round(x_vel);
y_move = round(y_vel);

// Simple bounce off of walls when we move too far to the side
// move distance and react accordingly.
for (var i = 0; i < abs(x_move); i++) {
	if (x+sign(x_vel) >= room_width - sprite_width/3) { 
		audio_play_sound(snd_wall, 10, false); //play the wall snd,
		x_vel *= -1; // reverse our velocity
	} else if (x+sign(x_vel) <= sprite_width/3) {
		audio_play_sound(snd_wall, 10, false); //play the wall snd,
		x_vel = -x_vel; // a different way of writing the direction reversal	
	}
	
	// Notice that throughout this loop, I'm using sign(x_vel) not sign(x_move),
	//because x_vel is the one we flip
	x += sign(x_vel);
}

// Move the player in the y direction, checking for collisions with platforms (only from the top!)
var sy = sign(y_vel);

if (!dead){ // don't bother with any of this if we're already gone
	while (y_move != 0){ // do this whole loop one pixel at a time until there are no pixels left to move
		
		var colliding = false; // have we collided with a platform? 
		var collidewith = noone; // storage var for our collision check
	
		if (sy >= 0){ // only check collisions if we're moving down, otherwise just move
			// Rather than checking place_meeting, use instance_place so that we also get a reference
			// to the object that we will collide with (if any)
			collidewith = instance_place(x, y+sy, obj_clouds);

			// Check if instance_place returned a valid reference to an instance of the obj_platform object
			if (collidewith != noone){    
	
				if (place_meeting(x, y, collidewith) == false){
					colliding = true;

					// Use dot notation to check and change values on the platform instance we're colliding with 
						if (collidewith.alarm[0] <= 1) {
							collidewith.alarm[0] = 1; // start timer
						}
					// All of the above code that uses the collidewith variable 
				}
			}	
		}

		if (!colliding) { // no collision, move one more pixel
			y += sy;
			y_move -= sy; // we just moved a pixel, now one pixel closer to being done
		}  else {
			// We hit a platform, so set our position to the hit location and start our jump
			y = y + sy;
			y_vel = jump_vel;	
			audio_play_sound(snd_jump, 10, false);
			
			// Reset our animation so it does the jump frames again
			image_speed = 1;
			image_index = 0;
			
			// And break out of the loop because we want to see the player hit the platform before they jump
			break;
		}			
	}
}


//VARIABLES to reset the death,
var reset_p1 = place_meeting(obj_player1.x, obj_player1.y+sy, obj_passingline);
var reset_p2 = place_meeting(obj_player2.x, obj_player2.y+sy, obj_passingline);

 if (reset_p2){
	 grav = .5;
	//if sy is 0
	if (sy >= 0){
		//play the sound
		if (alarm[1] <= 1){
			alarm[1] = room_speed * 1;
			alarm[1] = 1;	
		}
	
	instance_create_layer(self.x, room_height-50, "Instances", obj_stars); //draw stars,
	obj_player2.sprite_index = spr_player2_left; //reset player 2's sprite,
	if (coldblood_2 = true){ //make the death false,
		coldblood_2 = false;
		}
	}
} else if (reset_p1){
	grav = .5;
	//if sy is 0,
	if (sy >= 0){
		//play the sound
		if (alarm[1] <= 1){
			alarm[1] = room_speed * 1;
			alarm[1] = 1;	
		}
	
	instance_create_layer(self.x, room_height-50, "Instances", obj_stars); //draw stars,
	obj_player1.sprite_index = spr_player1_left; //reset player 1's sprite,
	if (coldblood_1 = true){ //make the death false,
		coldblood_1 = false;

		}
	}
} 

//if collide with the other player!

	var coldblood1 = instance_place(obj_player2.x, obj_player2.y-10, obj_player1);
	var coldblood2 = instance_place(obj_player1.x, obj_player1.y-10, obj_player2);
	
	//IF first player died,
	if (coldblood1){
		obj_player1.grav ++;
		audio_play_sound(snd_stomp, 10, false); //play stomp snd,
		instance_create_layer(obj_player1.x, obj_player1.y, "Instances", obj_stars); //create the stars
		global.p2score ++;
		coldblood_1 = true;	//make the falling dead boolean TRUE,
	} else if (coldblood2){
		obj_player2.grav ++;
		audio_play_sound(snd_stomp, 10, false); //play stomp snd,
		instance_create_layer(obj_player2.x, obj_player2.y, "Instances", obj_stars); //create the stars
		global.p1score ++;
		coldblood_2 = true;	//make the falling dead boolean TRUE,
	}
	
	if (coldblood_1 = true){ //if player 1 DIED,

		
			obj_player1.y_vel += grav; //keep going down
			obj_player1.sprite_index = spr_redead; //have dead sprite!
	} else if (coldblood_2 = true){ //if player 2 DIED,

		
		obj_player2.y_vel += grav; //keep going down
		obj_player2.sprite_index = spr_gdead; //have dead sprite!
	}
	
var respawn = instance_place(obj_player1.x, obj_player1.y+sy, obj_launcher);
var re2pawn = instance_place(obj_player2.x, obj_player2.y+sy, obj_launcher);
	
	if (respawn) { //if we bouncing on LAUNCHER
		if (alarm[0] <= 2){
			alarm[0] = room_speed * 2;
			alarm[0] = 2;	
		}
		obj_player1.x_vel = random_range(50, room_width -50); //a random range for the x_vel
		obj_player1.x = random_range (50, room_width - 50); //random range for x placement,
	
		obj_player1.x_vel += obj_player1.x_move; // while moving towards the right
		obj_player1.y_vel = obj_player1.jump_vel * 3; //bounce HIGH 

		instance_create_layer(obj_player1.x, room_height-50, "Instances", obj_stars); //have the star effects!
		
//to present the scores!
	global.pres1 = 1;	
	global.pres2 = 1;
	
	} else if (re2pawn) { //if we bouncing on LAUNCHER
		if (alarm[0] <= 2){
			alarm[0] = room_speed * 2;
			alarm[0] = 2;	
			
		}
		
		obj_player2.x_vel = random_range(50, room_width -50); //a random range for the x_vel
		obj_player2.x = random_range (50, room_width - 50); //random range for x placement,
	
		obj_player2.x_vel -= obj_player2.x_move; // while moving towards the right
		obj_player2.y_vel = obj_player2.jump_vel * 3; //bounce HIGH 

		instance_create_layer(obj_player1.x, room_height-50, "Instances", obj_stars); //have the star effects!
		

	}
	
//if player jumps on the respawn launcher
	if (respawn){
		while(!coldblood_1 = true || !coldblood_2 = true ){ //but they werent hit
			global.p1score -= 1; //add the score?
			
			break;
		}
	} else if (re2pawn){
		while(!coldblood_1 = true || !coldblood_2 = true ){ //but they werent hit
			global.p2score -= 1; //add the score?
			
			break;
		}
	}


// Reset the game if we press R
if (keyboard_check_pressed(ord("R"))) {
	room_restart();	
}
