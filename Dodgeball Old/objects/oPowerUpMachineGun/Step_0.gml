if (!visible && !global.pause) {
	if (duration <= 0) instance_destroy();
	if (fireCooldown <= 0) {
		fireCooldown = firerate;
		if (instance_number(oPlayer) > 0) { 
			instance_create_layer(oPlayer.x, oPlayer.y, "ShootsLayer", oShootBullet);
		}
	}
	fireCooldown--;
	duration--;
}

