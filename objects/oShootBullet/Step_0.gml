if (global.pause) {
	speed = 0;
} else {
	if (x < 0 or x > room_width or y < 0 or y > room_height) {
		instance_destroy();
	}
	speed = 16;
}

image_angle = direction - 90;