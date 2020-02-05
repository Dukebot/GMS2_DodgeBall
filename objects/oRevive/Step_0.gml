if (y > room_height/2-50) y -= 8;
else wait = false;
if (!wait) {
	instance_create_layer(x-132, y+150,"Interface",oYesButtonRewardedVideo);
	instance_create_layer(x+132, y+150,"Interface",oNoButtonRewardedVideo);
}
