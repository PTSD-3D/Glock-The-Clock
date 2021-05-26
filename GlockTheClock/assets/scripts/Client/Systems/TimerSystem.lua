local ns = require('namespace')

local TimerSystem = ns.class("TimerSystem",ns.System)

local timeTicks = 0
local timeSeconds = 0
local timeMinutes = 0

local stopped = false


function TimerSystem:initialize()
	ns.System.initialize(self)

	Manager.eventManager:addListener("ChangeSceneEvent", self, self.resetTimer)
end

function TimerSystem:resetTimer()
	timeTicks = 0
	timeSeconds = 0
	timeMinutes = 0
	changeText("Counter", "00:00")
end

function TimerSystem:toggleStop()
	stopped = not stopped
end

function TimerSystem:updateUI()
	local secs = ""
	local mins = ""

	if timeSeconds < 10 then
		secs = "0";
	end
	if timeMinutes < 10 then
		mins = "0";
	end

	secs = secs .. tostring(timeSeconds)
	mins = mins .. tostring(timeMinutes)
	changeText("Counter", mins .. ":" .. secs)
end

function TimerSystem:update(dt)
	if not stopped then
		timeTicks = timeTicks + dt
		if (timeTicks > 1) then
			timeSeconds = timeSeconds + 1
			timeTicks = timeTicks - 1
			self:updateUI()
		end
		if(timeSeconds%60 == 0) and not (timeSeconds == 0) then
			timeMinutes = timeMinutes + 1
			timeSeconds = 0
			self:updateUI()
		end
	end
end

Manager:addSystem(TimerSystem()) 