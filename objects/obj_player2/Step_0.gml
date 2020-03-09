// In order to expand on the parent's base Step Event functionality, right click on the event in the child
// and select "Inherit Event". "Override Event" will wipe the slate clean for the event and you will not inherit
// any of its behaviors (deleting the event_inherited() function call below will have similar results, so don't do that).

// Input handling specific to this inherited player object
// Accelerate the player (they have momentum: won't reverse direction immediately, takes a moment to build up speed).
// This is in contrast to the Narrative project, where we just set the player's speed to a fixed value immediately on input.
if (keyboard_check(vk_left)) {
	sprite_index = spr_player2_left
	x_vel -= x_accel;	
}
if (keyboard_check(vk_right)) {
	sprite_index = spr_player2_right;
	x_vel += x_accel;
}

// Inherit the parent event, run the logic defined in obj_player's Step Event now that we have our input
event_inherited();