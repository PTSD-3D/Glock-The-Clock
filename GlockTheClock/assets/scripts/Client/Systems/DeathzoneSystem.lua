local ns = require('namespace')

local DZSystem = ns.class("DZSystem",ns.System)

function DZSystem:requires() return {"death"} end

function DZSystem:initialize()
	ns.System.initialize(self)
	self.factor = 1
end

function DZSystem:onCollision(this, other, _)
	local playerComp = other:get("playerMove")
	if(playerComp ~= nil) then
		print("Player fell to DEATH")
		Manager.eventManager:fireEvent(ns.deathEvent(other))
		end
end

Manager:addSystem(DZSystem())