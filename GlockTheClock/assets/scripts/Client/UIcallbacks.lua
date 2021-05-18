--Main menu UI

function createMainMenuUIButtons()
	createButton("LevelsButton", "Levels", "PayumLook/Button", "LemonMilk-41", vec2:new(450, 180), vec2:new(400, 100))
	setButtonFunction("LevelsButton","switchToLevelSelector")

	createButton("SettingsButton", "Settings", "PayumLook/Button", "LemonMilk-41", vec2:new(450, 340), vec2:new(400, 100))

	createButton("ExitButton", "Exit", "PayumLook/Button", "LemonMilk-41", vec2:new(450, 500), vec2:new(400, 100))
	setButtonFunction("ExitButton","exitCallback")

	setWindowVisible("LevelsButton", false)
	setWindowVisible("SettingsButton", false)
	setWindowVisible("ExitButton", false)
end

function showMainMenuUI()
	setWindowVisible("MainMenu", true)
	
	setWindowVisible("LevelsButton", true)
	setWindowVisible("SettingsButton", true)
	setWindowVisible("ExitButton", true)

	setUIMouseCursorVisible(true)
end

function hideMainMenuUI()
	setWindowVisible("MainMenu", false)
	
	setWindowVisible("LevelsButton", false)
	setWindowVisible("SettingsButton", false)
	setWindowVisible("ExitButton", false)
end

--Level selector UI

function createLevelSelectorUIButtons()
	createButton("Level1Button", "Level 1", "PayumLook/Button", "LemonMilk-41", vec2:new(70, 60), vec2:new(400, 100))

	createButton("Level2Button", "Level 2", "PayumLook/Button", "LemonMilk-41", vec2:new(70, 210), vec2:new(400, 100))

	createButton("Level3Button", "Level 3", "PayumLook/Button", "LemonMilk-41", vec2:new(70, 360), vec2:new(400, 100))

	createButton("PlayButton", "Play", "PayumLook/Button", "LemonMilk-41", vec2:new(70, 510), vec2:new(400, 100))
	setButtonFunction("PlayButton","switchToLevel")

	setWindowVisible("Level1Button", false)
	setWindowVisible("Level2Button", false)
	setWindowVisible("Level3Button", false)
	setWindowVisible("PlayButton", false)
end

function showLevelSelectorUI()
	setWindowVisible("LevelSelector", true)

	setWindowVisible("Level1Button", true)
	setWindowVisible("Level2Button", true)
	setWindowVisible("Level3Button", true)
	setWindowVisible("PlayButton", true)
end

function hideLevelSelectorUI()
	setWindowVisible("LevelSelector", false)

	setWindowVisible("Level1Button", false)
	setWindowVisible("Level2Button", false)
	setWindowVisible("Level3Button", false)
	setWindowVisible("PlayButton", false)

	setUIMouseCursorVisible(false)
end

--Pause menu UI

function createPauseMenuUIButtons()
	createButton("ResumeButton", "Resume", "PayumLook/Button", "LemonMilk-41", vec2:new(450, 180), vec2:new(400, 100))
	setButtonFunction("ResumeButton", "hidePauseUI")
	
	createButton("BackButton", "Main menu", "PayumLook/Button", "LemonMilk-41", vec2:new(450, 500), vec2:new(400, 100))
	setButtonFunction("BackButton","switchToMainMenu")

	setWindowVisible("ResumeButton", false)
	setWindowVisible("BackButton", false)
end

function showPauseUI()
	setWindowVisible("PauseMenu", true)

	setWindowVisible("ResumeButton", true)
	setWindowVisible("SettingsButton", true)
	setWindowVisible("BackButton", true)

	setUIMouseCursorVisible(true)
end

function hidePauseUI()
	setWindowVisible("PauseMenu", false)

	setWindowVisible("ResumeButton", false)
	setWindowVisible("SettingsButton", false)
	setWindowVisible("BackButton", false)

	setUIMouseCursorVisible(false);
end

--HUD

function showHUD()
	setWindowVisible("HUD", true)

	setUIMouseCursorVisible(false)
end

function hideHUD()
	setWindowVisible("HUD", false)
end

function exitCallback()
	LOG("EXIT place holder")
end

--Button callbacks

function switchToLevelSelector()
	hideMainMenuUI()
	showLevelSelectorUI()
end

function switchToLevel()
	hideLevelSelectorUI()
	showHUD()
	--Here we switch scenes to the level selected
end

function switchToMainMenu()
	hidePauseUI()
	hideHUD()

	showMainMenuUI()

	--Here we switch scenes to the main menu
end