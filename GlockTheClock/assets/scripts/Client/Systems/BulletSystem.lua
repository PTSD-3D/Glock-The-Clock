local ns = require('namespace')

local BulletSystem = ns.class("BulletSystem",ns.System)

function BulletSystem:requires() return {"bullet"} end

function BulletSystem:initialize()
		ns.System.initialize(self)
		self.factor = 1
end

-- function BulletSystem:onCollision(ent, other, col)
-- 	ent.Mesh:setMaterial("Red")
-- 	other.Mesh:setMaterial("Red")
-- 	ent.Transform:translate(vec3:new(self.factor*math.random(1),self.factor*math.random(1),self.factor*math.random(1)))
-- 	other.Transform:translate(vec3:new(self.factor*-1*math.random(1),self.factor*-1*math.random(1),self.factor*-1*math.random(1)))
-- 	print("Collision Points:")
-- 	for i,v in ipairs(col) do
-- 		v:print("\t"..i..": ")
-- 	end	
-- 	self.factor = self.factor+1
-- end

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