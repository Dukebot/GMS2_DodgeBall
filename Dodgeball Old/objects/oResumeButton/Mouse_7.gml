if (mouse_x > x - sprite_width/2 and mouse_x < x + sprite_width/2
		and mouse_y > y - sprite_height/2 and mouse_y < y + sprite_height/2) {
	global.pause = false;
	instance_create_layer(0, 0, "Interface", oPauseButton);
	instance_destroy();
}