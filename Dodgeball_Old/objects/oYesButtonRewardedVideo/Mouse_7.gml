if (isMouseOnSprite()) {
	admob_show_rewarded_video();
	
	instance_destroy(oRevive);
	instance_destroy(oYesButtonRewardedVideo);
	instance_destroy(oNoButtonRewardedVideo);
}