local ns = require('namespace')

local TargetCollisionSystem = ns.class("TargetCollisionSystem", ns.System)

function TargetCollisionSystem:requires() return {"targetCollision"} end

function TargetCollisionSystem:onCollision(target, other, collision)
	if(other:has("playerMove")) then
		local targetCollision = target:get("targetCollision")
		Manager:removeEntity(target)
		LOG("Player scored " .. targetCollision.points .. " points")
	end
end

function TargetCollisionSystem:update(dt)
end

Manager:addSystem(TargetCollisionSystem())