var gameController;

if instance_exists(oGame) {
	gameController = oGame;	
} else if instance_exists(oChallengeTime) {
	gameController = oChallengeTime;
}

return gameController;