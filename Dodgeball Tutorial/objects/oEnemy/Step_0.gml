var speed_x = lengthdir_x(_speed, _direction);
var speed_y = lengthdir_y(_speed, _direction);
	
if x + speed_x < 0 or x + speed_x > room_width {
	speed_x *= -1;	
}
	
if y + speed_y < 0 or y + speed_y > room_height {
	speed_y *= -1;
}
	
x += speed_x;
y += speed_y;

_direction = point_direction(0, 0, speed_x, speed_y);