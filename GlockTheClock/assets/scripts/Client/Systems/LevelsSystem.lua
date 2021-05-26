local ns = require('namespace')

local LevelsSystem = ns.class("LevelsSystem",ns.System)

local currentLevel = "sampleScene";

local sampleSceneTime = "00:30";
local level1Time = "00:60";

function LevelsSystem:initialize()
	ns.System.initialize(self)
	Manager.eventManager:addListener("selectLevelEvent", self, self.onSelectedLevel)
	Manager.eventManager:addListener("initLevelEvent", self, self.onInitLevel)
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
	end

end

function LevelsSystem:onInitLevel()
	Manager:changeScene(currentLevel)
end

Manager:addSystem(LevelsSystem())