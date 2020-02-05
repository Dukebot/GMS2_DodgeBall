if (mouse_x > x - sprite_width/2 
	and mouse_x < x + sprite_width/2
	and mouse_y > y - sprite_height/2 
	and mouse_y < y + sprite_height/2
) {
	//The mouse it's on the sprite
	return true;
}
//The mose it's not on the sprite
return false;