if (!visible and !global.pause) {
	if (effectDuration < 1) instance_destroy();
	
	effectDuration--;
	if (cooldown < 1) {
		if (oGame.playerLives > 0) {
			instance_create_layer(oPlayer.x, oPlayer.y, "ShootsLayer", oShootPlasma);
		}
		cooldown = firerate;
	}
	cooldown--;
}