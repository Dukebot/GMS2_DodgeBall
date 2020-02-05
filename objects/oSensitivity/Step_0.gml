if mouse_check_button(mb_left) 
		and mouse_y > y - sprite_height/2 and mouse_y < y + sprite_height/2 {
		
	var increment = 0;
	if mouse_x > x - sprite_width/2 + increment and mouse_x < x + sprite_width/2 {
		image_index = 0;
		global.sensitivity = 1;
	}
	
	increment += sprite_width/7;
	if mouse_x > x - sprite_width/2 + increment and mouse_x < x + sprite_width/2 {
		image_index = 1;
		global.sensitivity = 1.5;
	}
	
	increment += sprite_width/7;
	if mouse_x > x - sprite_width/2 + increment and mouse_x < x + sprite_width/2 {
		image_index = 2;
		global.sensitivity = 2;
	}
	
	increment += sprite_width/7;
	if mouse_x > x - sprite_width/2 + increment and mouse_x < x + sprite_width/2 {
		image_index = 3;
		global.sensitivity = 2.5;
	}
	
	increment += sprite_width/7;
	if mouse_x > x - sprite_width/2 + increment and mouse_x < x + sprite_width/2 {
		image_index = 4;
		global.sensitivity = 3;
	}
	
	increment += sprite_width/7;
	if mouse_x > x - sprite_width/2 + increment and mouse_x < x + sprite_width/2 {
		image_index = 5;
		global.sensitivity = 3.5;
	}
	
	increment += sprite_width/7;
	if mouse_x > x - sprite_width/2 + increment and mouse_x < x + sprite_width/2 {
		image_index = 6;
		global.sensitivity = 4;
	}
	
	ini_open("settings");
	ini_write_real("settings", "sensitivity", global.sensitivity);
	ini_close();
}