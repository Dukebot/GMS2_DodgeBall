if (mouse_x > x - sprite_width/2 and mouse_x < x + sprite_width/2
		and mouse_y > y - sprite_height/2 and mouse_y < y + sprite_height/2) {
		
	instance_destroy(oMainButtonPause);
	instance_destroy(oRestartButtonPause);
	instance_destroy(oContinueButtonPause);
	instance_create_layer(0,0,"Interface", oAreYouSureMain);
}