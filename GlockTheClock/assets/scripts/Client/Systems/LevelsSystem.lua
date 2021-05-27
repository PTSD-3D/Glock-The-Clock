local ns = require('namespace')

local LevelsSystem = ns.class("LevelsSystem",ns.System)

local currentLevel = "sampleScene";

local sampleSceneTime = "00:00";
local level1Time = "00:00";
local level2Time = "00:00";
local level3Time = "00:00";

function LevelsSystem:initialize()
	ns.System.initialize(self)
	Manager.eventManager:addListener("selectLevelEvent", self, self.onSelectedLevel)
	Manager.eventManager:addListener("initLevelEvent", self, self.onInitLevel)
	Manager.eventManager:addListener("saveTimeLevelEvent", self, self.onSaveTimeLevel)
	Manager.eventManager:addListener("ChangeSceneEvent", self, self.onChangeLevel)
end

function LevelsSystem:level1Info()
	changeStaticImage("LevelImg","PayumLook/Level1")
	changeStaticImage("Medal","PayumLook/3Medal")

	changeText("LevelTime", level1Time)
end

function LevelsSystem:level2Info()
	changeStaticImage("LevelImg","PayumLook/Level2")
	changeStaticImage("Medal","PayumLook/2Medal")

	changeText("LevelTime", level2Time)
end

function LevelsSystem:level3Info()
	changeStaticImage("LevelImg","PayumLook/Level3")
	changeStaticImage("Medal","PayumLook/1Medal")

	changeText("LevelTime", level3Time)
end

function LevelsSystem:onSelectedLevel(event)
	currentLevel = event.level;
	if(currentLevel == "Level1") then
		self.level1Info()
	elseif (currentLevel == "Level2") then
		self.level2Info()
	elseif (currentLevel == "Level3") then
		self.level3Info()
	else
		self.level1Info()
	end
end

function LevelsSystem:onInitLevel()
	Manager:changeScene(currentLevel)
end

function LevelsSystem:onChangeLevel(event)
	currentLevel = event.newSceneName
end

function LevelsSystem:onSaveTimeLevel(event)
	if(currentLevel == "Level1") then
		level1Time = event.time
	elseif (currentLevel == "Level2") then
		level2Time = event.time
	elseif (currentLevel == "Level3") then
		level3Time = event.time
	end
end

Manager:addSystem(LevelsSystem())