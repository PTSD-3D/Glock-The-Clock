local ns = require('namespace')

local resources = require('resources')

local TargetCollisionSystem = ns.class("TargetCollisionSystem", ns.System)

local score = 0

function TargetCollisionSystem:requires() return {"targetCollision"} end

function TargetCollisionSystem:initialize()
	ns.System.initialize(self)
	Manager.eventManager:addListener("initLevelEvent", self, self.resetScore)
end

function TargetCollisionSystem:resetScore()
	score = 0;
	changeText("Score", "Score: " .. score)
end

function TargetCollisionSystem:onCollision(target, other, collision)
	if(other:has("bullet")) then	
		local targetCollision = target:get("targetCollision")
		Manager:removeEntity(target)

		local chan = playSound(resources.Sounds.HitTarget.id)
		setChannelVolume(chan,1)

		score = score + targetCollision.points
		changeText("Score", "Score: " .. score)
		LOG("Player scored " .. targetCollision.points .. " points")
	end
end

function TargetCollisionSystem:update(dt)
end

Manager:addSystem(TargetCollisionSystem())