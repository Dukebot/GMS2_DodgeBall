if (isMouseOnSprite()) {
	instance_destroy(oContinueButtonPause);
	instance_destroy(oMainButtonPause);
	instance_destroy(oRestartButtonPause);
		
	instance_create_layer(0,0,"Interface", oAreYouSureRestart);
}