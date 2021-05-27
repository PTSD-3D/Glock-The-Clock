local ns = require('namespace')
--Main menu UI

function createMainMenuUIButtons()
	createButton("LevelsButton", "Levels", "PayumLook/Button", "LemonMilk-41", vec2:new(0.35, 0.33), vec2:new(0.3, 0.13))
	setButtonFunction("LevelsButton","switchToLevelSelector")

	createButton("ExitButton", "Exit", "PayumLook/Button", "LemonMilk-41", vec2:new(0.35, 0.65), vec2:new(0.3, 0.13))
	setButtonFunction("ExitButton","exitCallback")

	setWindowVisible("LevelsButton", false)
	setWindowVisible("ExitButton", false)
end

function showMainMenuUI()
	setWindowVisible("MainMenu", true)
	
	setWindowVisible("LevelsButton", true)
	setWindowVisible("ExitButton", true)

	setUIMouseCursorVisible(true)
end

function hideMainMenuUI()
	setWindowVisible("MainMenu", false)
	
	setWindowVisible("LevelsButton", false)
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
	
	createButton("SettingsButton", "Settings", "PayumLook/Button", "LemonMilk-41", vec2:new(0.35, 0.45), vec2:new(0.3, 0.13))
	setButtonFunction("SettingsButton","switchToSettingsMenu")

	createButton("MainMenuButton", "Main menu", "PayumLook/Button", "LemonMilk-41", vec2:new(0.35, 0.65), vec2:new(0.3, 0.13))
	setButtonFunction("MainMenuButton","switchToMainMenuFromGame")

	setWindowVisible("ResumeButton", false)
	setWindowVisible("SettingsButton", false)
	setWindowVisible("MainMenuButton", false)
end

function showPauseUI()
	setWindowVisible("PauseMenu", true)

	setWindowVisible("ResumeButton", true)
	setWindowVisible("SettingsButton", true)
	setWindowVisible("MainMenuButton", true)

	setUIMouseCursorVisible(true)
end

function hidePauseUI()
	setWindowVisible("PauseMenu", false)

	setWindowVisible("ResumeButton", false)
	setWindowVisible("SettingsButton", false)
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
	setButtonFunction("BackButton","backToPause")

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
	ExitGame()
end

--Button callbacks

function switchToLevelSelector()
	hideMainMenuUI()
	showLevelSelectorUI()
	showLevel1Info()
end

function switchToLevel()
	hideLevelSelectorUI()
	showHUD()
	--Here we switch scenes to the level selected
	Manager.eventManager:fireEvent(ns.initLevelEvent())
end

function backToPause()
	hideSettingsMenuUI()

	showPauseUI()
end

function backToGame()
	hidePauseUI()

	showHUD()
end

function switchToMainMenuFromGame()
	hidePauseUI()
	hideHUD()

	Manager:changeScene('MainMenuScene')

	showMainMenuUI()
end

function switchToSettingsMenu()
	hidePauseUI()

	showSettingsMenuUI()
end

function volumeUp()
	Manager.eventManager:fireEvent(ns.upVolumeEvent())
end

function volumeDown()
	Manager.eventManager:fireEvent(ns.downVolumeEvent())
end

function showLevel1Info()
	Manager.eventManager:fireEvent(ns.selectLevelEvent("Level1"))
end

function showLevel2Info()
	Manager.eventManager:fireEvent(ns.selectLevelEvent("Level2"))
end

function showLevel3Info()
	Manager.eventManager:fireEvent(ns.selectLevelEvent("Level3"))
end