global.pause = false;
global.gameMode = GameMode.arcade;

var objects = [
	oMainTitle, 
	oPlayButton, 
	//oChallengeTimeButton, 
	oExitButton
];
var numObjects = array_length_1d(objects);

for (var i = 0; i < numObjects; i++) {
	instanceCreate(objects[i], room_width/2, room_height*(i+1)/(numObjects+1));
}