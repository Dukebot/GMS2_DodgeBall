draw_self();

var scoreFont = font_add_sprite_ext(sFontScore, "0123456789", true, 2);

draw_set_font(scoreFont);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_text(room_width/2, room_height/2, string(global.levelSelected));

font_delete(scoreFont);
