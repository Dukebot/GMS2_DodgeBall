if (!visible) {
	effectDuration--;
	oPlayer.star = true;
	if (effectDuration == 60) {
		oPlayer.hit = true;
		oPlayer.hitCount = 60;
	}
	if (effectDuration < 0) {
		oPlayer.star = false;
		instance_destroy();
	}
}