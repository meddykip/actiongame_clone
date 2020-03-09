// Check the current number of platforms that exist in the room
curr_num_platforms = instance_number(obj_clouds);

//random x and y variable
var CX = random_range(-10, room_width);
var CY = random_range(240, room_height-95);

//regular x and y will have the randomized variables,
x = CX;
y = CY;

//ITS FREE REALESTATE
//to check if theres collision
REALESTATE = place_meeting(CX, CY, obj_clouds);

//if cloud create is true,
if (cloudcreate = true){
	if (alarm[random_num] <= .5){
		//set alarm to create!
		alarm[random_num] = .5;	
	}
}

// if min cloud amt is true,
if (min_ccloud = true){
	//script!
	scr_cloud();
}

//if the current number of platforms is less than the minimum number of platforms,
if (curr_num_platforms < min_num_platforms){
	//if theres collision,

	if (REALESTATE){
		//no cloud create :(
		min_ccloud = false;
	} else {
		//else!
		//create!
		min_ccloud = true;	
	}
	
} 

//if the current number of platforms is MORE than the minimum number
//BUT is less than the max number,
if (curr_num_platforms >= min_num_platforms && curr_num_platforms < max_num_platforms ){
	//if theres collision,
	
	if (REALESTATE){
		//no cloud create :(
		cloudcreate = false;
	} else {
		//else!
		//create!
		cloudcreate = true;
	}
}

//if reached MAX clouds,
if (curr_num_platforms >= max_num_platforms){
	//no more creation!
	min_ccloud = false;
	cloudcreate = false;
}
