if (isMouseOnSprite()) {
	//Nos cargamos todos los botones del menú
	instance_destroy(all);
	
	//Ponemos el modo de juego a "tiempo"
	global.gameMode = GameMode.time;
	
	
	//Creación de los botones del menú:
	
	//Botón de jugar
	instanceCreate(oPlayButton,	room_width/2, room_height/2 - 150);
	
	//Flechas izquierda y derecha para seleccionar el nivel
	var arrow = instanceCreate(oArrow,room_width/2 - 100, room_height/2);
	arrow.sprite_index = sLeftArrow;
	
	var arrow = instanceCreate(oArrow,room_width/2 + 100, room_height/2);
	arrow.sprite_index = sRightArrow;
	
	//Botón para volver al menú pricipal
	instanceCreate(oMainButton, room_width/2, room_height/2 + 150);
}