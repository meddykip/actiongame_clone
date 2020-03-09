// Draw GUI event does not move when the camera moves, so we can safely use it to draw things we want to be always-on-screen.
// downside is it doesn't respect camera scaling so we also have to manually scale the text.

draw_set_font(font0);
var ww = window_get_width();

// draw text for player 1 being gone
draw_set_halign(fa_left);
if (global.pres1 == 1) { //if its Time to present score, present
		draw_text_transformed_colour(10,10, string(global.p1score),3,3,0,c_red,c_red,c_maroon,c_maroon,1);
}

// draw text for player 2 being gone
draw_set_halign(fa_right);
if (global.pres2 == 1) { //if its Time to present score, present
		draw_text_transformed_colour(ww-10,10, string(global.p2score),3,3,0,c_green,c_green,c_lime,c_lime,1);
}
