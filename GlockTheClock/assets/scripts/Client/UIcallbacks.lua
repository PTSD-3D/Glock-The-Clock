--Main menu UI

function createMainMenuUIButtons()
	createButton("LevelsButton", "Levels", "PayumLook/Button", "LemonMilk-41", vec2:new(0.35, 0.25), vec2:new(0.3, 0.13))
	setButtonFunction("LevelsButton","switchToLevelSelector")

	createButton("SettingsButton", "Settings", "PayumLook/Button", "LemonMilk-41", vec2:new(0.35, 0.45), vec2:new(0.3, 0.13))
	setButtonFunction("SettingsButton","switchToSettingsMenu")

	createButton("ExitButton", "Exit", "PayumLook/Button", "LemonMilk-41", vec2:new(0.35, 0.65), vec2:new(0.3, 0.13))
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
	createButton("Level1Button", "Level 1", "PayumLook/Button", "LemonMilk-41", vec2:new(0.04, 0.1), vec2:new(0.3, 0.13))
	setButtonFunction("Level1Button","showLevel1Info")
	
	createButton("Level2Button", "Level 2", "PayumLook/Button", "LemonMilk-41", vec2:new(0.04, 0.3), vec2:new(0.3, 0.13))
	setButtonFunction("Level2Button","showLevel2Info")

	createButton("Level3Button", "Level 3", "PayumLook/Button", "LemonMilk-41", vec2:new(0.04, 0.5), vec2:new(0.3, 0.13))
	setButtonFunction("Level3Button","showLevel3Info")

	createButton("PlayButton", "Play", "PayumLook/Button", "LemonMilk-41", vec2:new(0.065, 0.7), vec2:new(0.25, 0.13))
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
	createButton("ResumeButton", "Resume", "PayumLook/Button", "LemonMilk-41", vec2:new(0.35, 0.25), vec2:new(0.3, 0.13))
	setButtonFunction("ResumeButton", "hidePauseUI")
	
	createButton("MainMenuButton", "Main menu", "PayumLook/Button", "LemonMilk-41", vec2:new(0.35, 0.65), vec2:new(0.3, 0.13))
	setButtonFunction("MainMenuButton","switchToMainMenuFromGame")

	setWindowVisible("ResumeButton", false)
	setWindowVisible("MainMenuButton", false)
end

function showPauseUI()
	setWindowVisible("PauseMenu", true)

	setWindowVisible("ResumeButton", true)
	setWindowVisible("MainMenuButton", true)

	setUIMouseCursorVisible(true)
end

function hidePauseUI()
	setWindowVisible("PauseMenu", false)

	setWindowVisible("ResumeButton", false)
	setWindowVisible("MainMenuButton", false)

	setUIMouseCursorVisible(false);
end

--Settings menu UI

function createSettingsMenuUIButtons()
	createButton("LeftArrowButton", "", "PayumLook/ButtonLeftArrow", "LemonMilk-41", vec2:new(0.17, 0.35), vec2:new(0.06, 0.1))
	setButtonFunction("LeftArrowButton", "volumeDown")
	
	createButton("RightArrowButton", "", "PayumLook/ButtonRightArrow", "LemonMilk-41", vec2:new(0.768, 0.35), vec2:new(0.06, 0.1))
	setButtonFunction("RightArrowButton","volumeUp")

	createButton("BackButton", "Back", "PayumLook/Button", "LemonMilk-41", vec2:new(0.35, 0.65), vec2:new(0.3, 0.13))
	setButtonFunction("BackButton","switchToMainMenu")

	setWindowVisible("LeftArrowButton", false)
	setWindowVisible("RightArrowButton", false)
	setWindowVisible("BackButton", false)
end

function showSettingsMenuUI()
	setWindowVisible("SettingsMenu", true)

	setWindowVisible("LeftArrowButton", true)
	setWindowVisible("RightArrowButton", true)
	setWindowVisible("BackButton", true)

	setUIMouseCursorVisible(true)
end

function hideSettingsMenuUI()
	setWindowVisible("SettingsMenu", false)

	setWindowVisible("LeftArrowButton", false)
	setWindowVisible("RightArrowButton", false)
	setWindowVisible("BackButton", false)
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
	Manager:changeScene('sampleScene')
end

function switchToMainMenu()
	hideSettingsMenuUI()

	showMainMenuUI()
end

function switchToMainMenuFromGame()
	hidePauseUI()
	hideHUD()

	Manager:changeScene('MainMenuScene')

	showMainMenuUI()
end

function switchToSettingsMenu()
	hideMainMenuUI()

	showSettingsMenuUI()
end

function volumeUp()
	setProgressBarValue("VolumePB",0.5)
end

function volumeDown()
	setProgressBarValue("VolumePB", 0.2);
end

function showLevel1Info()
	changeStaticImage("LevelImg","PayumLook/Level1")
	changeStaticImage("Medal","PayumLook/1Medal")

	changeText("LevelTime","00:30")
end

function showLevel2Info()
	changeStaticImage("LevelImg","PayumLook/Level2")
	changeStaticImage("Medal","PayumLook/2Medal")

	changeText("LevelTime","00:40")
end

function showLevel3Info()
	changeStaticImage("LevelImg","PayumLook/Level3")
	changeStaticImage("Medal","PayumLook/3Medal")

	changeText("LevelTime","00:35")
end