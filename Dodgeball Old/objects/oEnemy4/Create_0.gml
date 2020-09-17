if (instance_number(oPlayer) == 0) {
	instance_destroy();
} else {
	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
	speedBase = 2 + oGame.enemySpeedInc
	speed = speedBase;
}
