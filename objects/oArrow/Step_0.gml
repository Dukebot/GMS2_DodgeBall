if (global.gameMode != GameMode.time) exit;

if (isMouseOnSprite() and mouse_check_button_released(mb_left)) {
	if (sprite_index == sLeftArrow) {
		global.levelSelected--;
		
		if (global.levelSelected < 1) {
			global.levelSelected = 1;
		}
	} else if (sprite_index == sRightArrow) {
		global.levelSelected++;
		
		if (global.levelSelected > 100) {
			global.levelSelected = 100;	
		}
	}
}
