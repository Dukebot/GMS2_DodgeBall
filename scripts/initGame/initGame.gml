// Read settings file
ini_open("settings");
{
	global.hScore = ini_read_real("stats", "hScore", 0);
	global.sensitivity = ini_read_real("settings", "sensitivity", 1);
}
ini_close();

enum GameMode {
	arcade, time
}

//GAME VARIABLES
global.debug = true;
global.pause = false;
global.gamesPlayed = 0; // incremented everytime oGame creates
global.rewarded = false;
global.gameMode = GameMode.arcade;
global.levelSelected = 1;
global.inventoryMode = false;

if os_type == os_android {
	if not achievement_login_status() achievement_login();
	admob_init_interstitial("ca-app-pub-9319458226444690/6536143218");
	admob_init_rewarded_video("ca-app-pub-9319458226444690/8381122639");
}

room_goto(rMenu);