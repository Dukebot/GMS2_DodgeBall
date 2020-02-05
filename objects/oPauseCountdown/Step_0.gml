count++;
if (count > 40) {
	image_index = 1;	
}
if (count > 80) {
	image_index = 2;	
}

if (count > 120) {
	global.pause = false;
	if instance_number(oPauseButton == 0) instance_create_layer(0, 0, "Interface", oPauseButton);
	instance_destroy();
}