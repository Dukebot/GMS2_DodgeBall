//Create the game over menu
var menu_title = instance_create_layer(room_width/2, 200, "Interface", oMenuTitle);
menu_title.text = "You Lost!";
instance_create_layer(room_width/2, 400, "Interface", oRestartButton);
instance_create_layer(room_width/2, 500, "Interface", oExitButton);