instanceCreate(oGame);
instanceCreate(oPlayer, room_width/2, room_height/2);
instanceCreate(oGetReady, room_width/2, room_height/2, "Interface");
instanceCreate(oPauseButton, 0, 0, "Interface");

layer_background_alpha(layer_background_get_id(layer_get_id("Flash")), 0);