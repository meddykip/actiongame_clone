grav = .5; // Constant downward force 

jump_vel = -16; // initial velocity of a jump

x_accel = 8; // acceleration rate for horizontal movement
x_vel = 0; // current horizontal velocity
y_vel = 0; // current vertical velocity

x_vel_max = 9; // max horizontal velocity

x_move = 0; // since we'll be dealing with fractional velocities, separate variable for actual movement
y_move = 0; // since we'll be dealing with fractional velocities, separate variable for actual movement

dead = false;

coldblood_1 = false; //when player 1 dies
coldblood_2 = false; //when player 2 dies

fall = 1;

global.pres1 = 0;
global.pres2 = 0;

movemen = true;

global.p1score = 0;
global.p2score = 0;


//TO SHOW SCORES:
	//PLAYER_1 show score!
	global.respoon = false;

	//PLAYER_2 show score!
	global.refork = false;

alarm[1] = room_speed * 1; 

global.player_w = obj_player.sprite_width