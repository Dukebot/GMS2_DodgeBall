// mirror mouse movement
if (os_type == os_android) {
	if mouse_check_button(mb_left) {
		if mouse_x != mouseXBefore and mouseXBefore != 0 {
			var differenceX = (mouseXBefore - mouse_x)*global.sensitivity;
			x -= differenceX;
		}
		if mouse_y != mouseYBefore and mouseYBefore != 0 {
			var differenceY = (mouseYBefore - mouse_y)*global.sensitivity;
			y -= differenceY;
		}
		mouseXBefore = mouse_x;
		mouseYBefore = mouse_y;
	} else {
		mouseXBefore = 0;
		mouseYBefore = 0;
	}
// mouse to mouse position
} else {
	direction = point_direction(x, y, mouse_x, mouse_y);
		
	if (x > mouse_x - speedBase and x < mouse_x + speedBase
		and y > mouse_y - speedBase and y < mouse_y + speedBase
	) {
		x = mouse_x;
		y = mouse_y;
		speed = 0;
	} else {
		speed = speedBase;
	}
}