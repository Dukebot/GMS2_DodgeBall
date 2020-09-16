draw_self();

if (drawResume) {
	scoreFont = font_add_sprite_ext(sFontScoreBig, "0123456789", true, 2);
	
	//Draw configuration
	draw_set_font(scoreFont);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	//Score
	draw_sprite(sScore, 0, x, y + 80);
	draw_text(x + 50, y + 90, string(playerScore));
	
	//High score
	draw_sprite(sHiScore, 0, x, y + 120);
	draw_text(x + 50, y + 130, string(global.hScore));
	
	font_delete(scoreFont);
}