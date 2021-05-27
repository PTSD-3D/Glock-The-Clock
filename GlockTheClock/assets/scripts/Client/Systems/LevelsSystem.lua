local ns = require('namespace')

local LevelsSystem = ns.class("LevelsSystem",ns.System)

local currentLevel = "sampleScene";

local sampleSceneTime = "00:00";
local level1Time = "00:00";

function LevelsSystem:initialize()
	ns.System.initialize(self)
	Manager.eventManager:addListener("selectLevelEvent", self, self.onSelectedLevel)
	Manager.eventManager:addListener("initLevelEvent", self, self.onInitLevel)
	Manager.eventManager:addListener("saveTimeLevelEvent", self, self.onSaveTimeLevel)
	Manager.eventManager:addListener("ChangeSceneEvent", self, self.onChangeLevel)
end

function LevelsSystem:sampleSceneInfo()
	changeStaticImage("LevelImg","PayumLook/Level1")
	changeStaticImage("Medal","PayumLook/2Medal")

	changeText("LevelTime", sampleSceneTime)
end

function LevelsSystem:level1Info()
	changeStaticImage("LevelImg","PayumLook/Level2")
	changeStaticImage("Medal","PayumLook/1Medal")

	changeText("LevelTime", level1Time)
end

function LevelsSystem:onSelectedLevel(event)
	currentLevel = event.level;
	if(currentLevel == "sampleScene") then
		self.sampleSceneInfo()
	elseif (currentLevel == "Level1") then
		self.level1Info()
	else
		self.sampleSceneInfo()
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