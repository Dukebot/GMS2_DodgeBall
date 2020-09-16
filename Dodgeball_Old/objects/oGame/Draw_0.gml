//DRAW HUD SPRITE AT TOP
//draw_sprite(sHUD, 0, room_width/2, 0);

//DRAW PLAYER LIVES
var margin = 30;
for (var i = 0; i < playerLives; i++) {
	draw_sprite(sLifeHud, 0, i*margin + 20, 24);
}

draw_set_color(c_white);

//GAME TIME MODE
if (global.gameMode == GameMode.time) {
	draw_set_font(-1);
	draw_set_halign(fa_center);
	
	if gameWin  {draw_text(room_width/2, 300, "Game Win!");}
	if gameLost {draw_text(room_width/2, 300, "Game Lost!");}
}

//DRAW SCORE
var scoreFont = font_add_sprite_ext(sFontScore, "0123456789", true, 2);
{
	draw_set_font(scoreFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);

	//draw_text(room_width - 3, 25, string(playerScore));
	draw_text_transformed(room_width/2, 25, string(playerScore), 2, 2, 0);
}
font_delete(scoreFont);


//DEBUG INFORMATION
if (global.debug) {
	var marginY = 60;
	var margin = 25;
	
	draw_set_halign(fa_left);
	
	draw_text(margin, marginY+margin*1, "Level " + string(level));
	draw_text(margin, marginY+margin*2, "Time " + string(time/60));
	draw_text(margin, marginY+margin*3, "Kills " + string(playerEnemiesKilled));
	draw_text(margin, marginY+margin*4, "Enemy Speed " + string(enemySpeed));
	draw_text(margin, marginY+margin*5, "Enemy SpawnRate (s) " + string(enemySpawnRate/60));
	
	if (instance_exists(oPlayer) and global.inventoryMode) {
		with (oPlayer) {
			draw_text(margin, marginY+margin*7, "machineGun " + string(machineGun));
			draw_text(margin, marginY+margin*8, "plasmaGun " + string(plasmaGun));
			draw_text(margin, marginY+margin*9, "bombs " + string(bombs));
		}
	}
}