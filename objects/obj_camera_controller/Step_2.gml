//set the x permanently as 0,
x = 0;

//variable for chosen player,
ch = noone;

//if p1's y is higher then p2, follow them!
if (obj_player1.y > obj_player2.y){
	ch = lerp(obj_player1.y, obj_player2.y, .5);
} else if (obj_player1.y < obj_player2.y){
	//else if p2 is pog, follow them instead!!!!
	ch = lerp(obj_player2.y, obj_player1.y, .5);
}

//lerp!
cam_y = lerp(ch, 0, .5);

cam_y = max(cam_y, 0);
cam_y = min(cam_y, room_height - camera_get_view_height(view_camera[0])); //so the camera wont go out of bounds!!

camera_set_view_pos(view_camera[0], x, cam_y);