if (isMouseOnSprite()) {
	instance_create_layer(0,0,"Interface",oGameOver);
	
	instance_destroy(oRevive);
	instance_destroy(oYesButtonRewardedVideo);
	instance_destroy(oNoButtonRewardedVideo);
}