if (isMouseOnSprite()) {
	if !achievement_login_status() {
		achievement_login();
	}
	if achievement_login_status() and achievement_available() {
		achievement_show_leaderboards();
	}
}