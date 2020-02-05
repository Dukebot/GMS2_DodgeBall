if (global.pause) exit;

var size = sprite_width/2;
var yTop = 50; //Margin for the score and lives

// bouncing screen movement
var speedX = lengthdir_x(Speed, Direction);	
if (x + size > room_width) or (x - size < 0) {
	speedX = -speedX;
	audio_sound_pitch(sndBounce, random_range(0.9, 1.1));
	audio_play_sound(sndBounce, 0, false);
}
var speedY = lengthdir_y(Speed, Direction);
if (y + size > room_height) or (y - size < yTop) {
	speedY = -speedY;
	audio_sound_pitch(sndBounce, random_range(0.9, 1.1));
	audio_play_sound(sndBounce, 0, false);
}
	
x = x + speedX;
y = y + speedY;

// update speed and direction
Speed = point_distance(0, 0, speedX, speedY);
Direction = point_direction(0, 0, speedX, speedY);