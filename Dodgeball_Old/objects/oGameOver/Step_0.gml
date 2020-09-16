if (y > room_height/4) {
	y -= 10;	
} else {
	drawResume = true;
	
	if (instance_number(oRestartButton) == 0) 
		instance_create_layer(x, y+240, "Interface", oRestartButton);
	
	if (instance_number(oMainButton) == 0) 
		instance_create_layer(x, y+360, "Interface", oMainButton);
	
	if (not statsUpdated) {
		updateStatus();
		statsUpdated = true;
	}
}
