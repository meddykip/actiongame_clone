//alarm: to grow in due time if no collision

//if small cloud, grow!
if (sprite_index == spr_smallcloud) {
   sprite_index = spr_mediumcloud;
   alarm[1] = room_speed * 6;
} //else if medium cloud, grow!
else if (sprite_index == spr_mediumcloud) {
   sprite_index = spr_mmediumcloud;
   alarm[1] = room_speed * 6;
} //else if medium medium cloud, grow!
else if (sprite_index == spr_mmediumcloud) {
   sprite_index = spr_largecloud;
   alarm[1] = room_speed * 6;
}
