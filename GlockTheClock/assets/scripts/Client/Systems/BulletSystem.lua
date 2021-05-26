local ns = require('namespace')

local BulletSystem = ns.class("BulletSystem",ns.System)

function BulletSystem:requires() return {"bullet"} end

function BulletSystem:initialize()
		ns.System.initialize(self)
		self.factor = 1
end

function BulletSystem:onCollision(ent, other, col)
	if(other:has("floor")) then
		LOG("LA BALA ISO FLOP")
		Manager:removeEntity(ent)
	elseif(other:has("targetCollision")) then
		LOG("LA BALA ISO PUM A LA COSA")
		Manager:removeEntity(ent)
		--Manager:removeEntity(other)
	end
end

function BulletSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local bullet = entity:get("bullet")
		local dir = bullet.direction:normalize()*bullet.speed
		entity.Rigidbody:setLinearVelocity(dir)

		bullet.lifetime = bullet.lifetime - 1
		if(bullet.lifetime <= 0) then
			Manager:removeEntity(entity)
		end
	end
	self.collided = {}
end

Manager:addSystem(BulletSystem())