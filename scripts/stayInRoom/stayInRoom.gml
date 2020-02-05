if (x + lengthdir_x(speed, direction) < sprite_width/2) {
	x = sprite_width/2;
	speed = 0;
}
if (x + lengthdir_x(speed, direction) > room_width-sprite_width/2) {
	x = room_width-sprite_width/2;
	speed = 0;
}
if (y + lengthdir_y(speed, direction) < sprite_height/2 + 50) {
	y = sprite_height/2 + 50;
	speed = 0;
}
if (y + lengthdir_y(speed, direction) > room_height-sprite_height/2) {
	y = room_height-sprite_height/2;
	speed = 0;
}