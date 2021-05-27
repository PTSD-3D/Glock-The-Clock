local ns = require('namespace')

local LevelsSystem = ns.class("LevelsSystem",ns.System)

local currentLevel = "sampleScene";

local sampleSceneTime = "00:00";
local level1Mins = 0;
local level1Secs = 0;
local level2Mins = 0;
local level2Secs = 0;
local level3Mins = 0;
local level3Secs = 0;

function LevelsSystem:initialize()
	ns.System.initialize(self)
	Manager.eventManager:addListener("selectLevelEvent", self, self.onSelectedLevel)
	Manager.eventManager:addListener("initLevelEvent", self, self.onInitLevel)
	Manager.eventManager:addListener("saveTimeLevelEvent", self, self.onSaveTimeLevel)
	Manager.eventManager:addListener("ChangeSceneEvent", self, self.onChangeLevel)
end

function LevelsSystem:level1Info()
	changeStaticImage("LevelImg","PayumLook/Level1")

	if(level1Mins >= 3 or (level1Mins == 0 and level1Secs == 0)) then
		changeStaticImage("Medal","PayumLook/3Medal")
	elseif(level1Mins >= 1) then
		changeStaticImage("Medal","PayumLook/2Medal")
	else
		changeStaticImage("Medal","PayumLook/1Medal")
	end

	local secs = ""
	local mins = ""

	if level1Secs < 10 then
		secs = "0";
	end
	if level1Mins < 10 then
		mins = "0";
	end

	secs = secs .. tostring(level1Secs)
	mins = mins .. tostring(level1Mins)

	changeText("LevelTime", mins .. ":" .. secs)
end

function LevelsSystem:level2Info()
	changeStaticImage("LevelImg","PayumLook/Level2")

	if(level2Mins >= 3 or (level2Mins == 0 and level2Secs == 0)) then
		changeStaticImage("Medal","PayumLook/3Medal")
	elseif(level2Mins >= 1) then
		changeStaticImage("Medal","PayumLook/2Medal")
	else
		changeStaticImage("Medal","PayumLook/1Medal")
	end

	local secs = ""
	local mins = ""

	if level2Secs < 10 then
		secs = "0";
	end
	if level2Mins < 10 then
		mins = "0";
	end

	secs = secs .. tostring(level2Secs)
	mins = mins .. tostring(level2Mins)

	changeText("LevelTime", mins .. ":" .. secs)
end

function LevelsSystem:level3Info()
	changeStaticImage("LevelImg","PayumLook/Level3")

	if(level3Mins >= 3 or (level3Mins == 0 and level3Secs == 0)) then
		changeStaticImage("Medal","PayumLook/3Medal")
	elseif(level3Mins >= 1) then
		changeStaticImage("Medal","PayumLook/2Medal")
	else
		changeStaticImage("Medal","PayumLook/1Medal")
	end

	local secs = ""
	local mins = ""

	if level3Secs < 10 then
		secs = "0";
	end
	if level3Mins < 10 then
		mins = "0";
	end

	secs = secs .. tostring(level3Secs)
	mins = mins .. tostring(level3Mins)

	changeText("LevelTime", mins .. ":" .. secs)
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
		level1Mins = event.mins
		level1Secs = event.secs
	elseif (currentLevel == "Level2") then
		level2Mins = event.mins
		level2Secs = event.secs
	elseif (currentLevel == "Level3") then
		level3Mins = event.mins
		level3Secs = event.secs
	end
end

Manager:addSystem(LevelsSystem())