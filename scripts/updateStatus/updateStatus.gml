// update hScore if it's the case

if (oGame.playerScore > global.hScore) {
	global.hScore = oGame.playerScore;
	
	ini_open("settings");
	ini_write_real("stats", "hScore", global.hScore);
	ini_close();
}
	
// post hScore to google play services and achievements
if achievement_login_status() and achievement_available() {
	achievement_post_score("CgkIuJj_1NgFEAIQAA", global.hScore);
	//if (playerScore > 15000) achievement_post("CgkIuJj_1NgFEAIQAw", 100);
	//if (playerScore > 30000) achievement_post("CgkIuJj_1NgFEAIQBA", 100);
	//if (playerScore > 45000) achievement_post("CgkIuJj_1NgFEAIQBQ", 100);
	//if (oGame.playerEnemiesKilled > 100) achievement_post("CgkIuJj_1NgFEAIQCA", 100);
}