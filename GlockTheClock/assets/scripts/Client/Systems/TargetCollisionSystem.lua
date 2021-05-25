local ns = require('namespace')

local resources = require('resources')

local TargetCollisionSystem = ns.class("TargetCollisionSystem", ns.System)

function TargetCollisionSystem:requires() return {"targetCollision"} end

function TargetCollisionSystem:onCollision(target, other, collision)
	if(other:has("bullet") or other:has("playerMove")) then	--The player can break the targets with his body too
		local targetCollision = target:get("targetCollision")
		Manager:removeEntity(target)

		local chan = playSound(resources.Sounds.HitTarget.id)
		setChannelVolume(chan,1)
		LOG("Player scored " .. targetCollision.points .. " points")
	end
end

function TargetCollisionSystem:update(dt)
end

Manager:addSystem(TargetCollisionSystem())