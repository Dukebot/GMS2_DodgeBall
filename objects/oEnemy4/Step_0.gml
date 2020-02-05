if (!global.pause) {
	if (instance_number(oPlayer) > 0) {
		direction = point_direction(x, y, oPlayer.x, oPlayer.y);
		speed = speedBase;
	}
} else {
	speed = 0;
}



