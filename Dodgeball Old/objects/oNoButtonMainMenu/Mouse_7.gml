if (mouse_x > x - sprite_width/2 and mouse_x < x + sprite_width/2
		and mouse_y > y - sprite_height/2 and mouse_y < y + sprite_height/2) {
			

	instance_create_layer(room_width/2, room_height/2-100,"Interface", oContinueButtonPause);
	instance_create_layer(room_width/2, room_height/2,"Interface", oRestartButtonPause);
	instance_create_layer(room_width/2, room_height/2+100,"Interface", oMainButtonPause);
	
	instance_destroy(oYesButtonMainMenu);
	instance_destroy(oNoButtonMainMenu);
	instance_destroy(oAreYouSureMain);
}