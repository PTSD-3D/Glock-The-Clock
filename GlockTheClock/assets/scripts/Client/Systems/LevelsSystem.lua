local ns = require('namespace')

local LevelsSystem = ns.class("LevelsSystem",ns.System)

local currentLevel = "sampleScene";

local sampleSceneTime = "00:30";
local level1Time = "00:60";

function LevelsSystem:initialize()
	ns.System.initialize(self)
	Manager.eventManager:addListener("selectLevelEvent", self, self.onSelectedLevel)
	Manager.eventManager:addListener("initLevelEvent", self, self.onInitLevel)
	Manager.eventManager:addListener("saveTimeLevelEvent", self, self.onSaveTimeLevel)
	Manager.eventManager:addListener("ChangeSceneEvent", self, self.onChangeLevel)
end

function LevelsSystem:onSelectedLevel(event)
	currentLevel = event.level;
	if(currentLevel == "sampleScene") then
		changeStaticImage("LevelImg","PayumLook/Level1")
		changeStaticImage("Medal","PayumLook/1Medal")

		changeText("LevelTime", sampleSceneTime)
	elseif (currentLevel == "Level1") then
		changeStaticImage("LevelImg","PayumLook/Level2")
		changeStaticImage("Medal","PayumLook/2Medal")

		changeText("LevelTime", level1Time)
	else
		changeStaticImage("LevelImg","PayumLook/Level1")
		changeStaticImage("Medal","PayumLook/1Medal")

		changeText("LevelTime", sampleSceneTime)
	end

end

function LevelsSystem:onInitLevel()
	Manager:changeScene(currentLevel)
end

function LevelsSystem:onChangeLevel(event)
	currentLevel = event.newSceneName
end

function LevelsSystem:onSaveTimeLevel(event)
	if(currentLevel == "sampleScene") then
		sampleSceneTime = event.time
	elseif (currentLevel == "Level1") then
		level1Time = event.time
	end
end

Manager:addSystem(LevelsSystem())