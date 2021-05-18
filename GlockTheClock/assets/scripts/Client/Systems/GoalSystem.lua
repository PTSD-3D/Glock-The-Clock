local ns = require('namespace')

local GoalSystem = ns.class("GoalSystem",ns.System)

function GoalSystem:requires() return {"goal"} end

function GoalSystem:initialize()
	ns.System.initialize(self)
    LOG("Init goalsys",LogLevel.Critical,1)
end

function GoalSystem:onCollision(_,other,_)
	if(other:has("playerMove")) then
		LOG("WOW DANIEL, NICE MOVES")
		Manager.eventManager:fireEvent(ns.goalEvent(other))
	end
end

Manager:addSystem(GoalSystem())