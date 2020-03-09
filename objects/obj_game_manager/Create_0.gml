curr_num_platforms = 0; // the number of platforms currently in the room
min_num_platforms = 5; // the min number of platforms we want in the room at any time
max_num_platforms = 35; // the max number of platforms we want in the room at any time (used only for initial population)

//variables for cloud creation
cloudcreate = false;
min_ccloud = false;

//random numbers to choose the spawn alarms,
//so the clouds will Appear to have different spawn times
random_num = random_range(0, 2);

//to handle the room speed
alarm[random_num] = room_speed * .5;

