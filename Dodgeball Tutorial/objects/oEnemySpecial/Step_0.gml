if instance_exists(oPlayer) {
	_direction = point_direction(x, y, oPlayer.x, oPlayer.y)
	event_inherited();
}