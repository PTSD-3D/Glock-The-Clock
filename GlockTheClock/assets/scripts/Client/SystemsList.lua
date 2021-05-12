local ns = reqNamespace
local prefabs = reqPrefab

LOG("Loading systems...", LogLevel.Info, 1)

--Define new systems here
local MoveSystem = ns.class("MoveSystem",ns.System)

function MoveSystem:requires()
	return {"playerMove"}
end

local camChild = false;
-- function MoveSystem:initialize()
-- 	for _, entity in pairs(self.targets) do
-- 		local tr = entity.Transform
-- 		tr.setChildCamera()
-- 	end
-- end

function MoveSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local tr = entity.Transform
		local rb = entity.Rigidbody
		local vel = entity:get("playerMove").vel;
		local vr = entity:get("playerMove").vrot;

		--makes the camera transform child of the player transform
		if (not camChild) then
		 	tr:setChildCamera()
		 	camChild = true
		end

		--rotation + camera
		local mouseDirection = getMouseRelativePosition()
		mouseDirection =  mouseDirection * vr
		local rot = vec3:new(0, -mouseDirection.x, 0)
		pitchCamera(mouseDirection.y*dt)
		rb:setAngularVelocity(rot)

		--getting direction vector
		local dir = vec3:new(0, 0, 0);
		if keyPressed(PTSDKeys.A) then
			dir = dir - tr:getRight()
		end
		if keyPressed(PTSDKeys.W) then
			dir = dir + tr:getForward()
		end
		if keyPressed(PTSDKeys.S) then
			dir = dir - tr:getForward()
		end
		if keyPressed(PTSDKeys.D) then
			dir = dir + tr:getRight()
		end

		--making the velocity vector's magnitude equal to vel
		local vtotal = dir:normalize() * vel

		--making sure the jump isn't overwritten
		vtotal.y = rb:getLinearVelocity().y

		--if rb:isgrounded()		Needs to check if the rb is on the ground, we can use a downwards raycast or the collision normals to see if it's the ground
		if rb:hasRayCastHit(vec3:new(0, -100, 0)) then 
			print("tiene suelo debajo")
		else
			print("no hay suelo")
		end
		if keyJustPressed(PTSDKeys.Space) then
			--adds the force of the jump
			local force = vec3:new(0, entity:get("playerMove").jump, 0)
			local ref = vec3:new(0, 0, 0)
			rb:addForce(force, ref)

			--this is only necessary because the player is on the void
			vtotal.y = 0
		end

		rb:setLinearVelocity(vtotal)
	end
end

Manager:addSystem(MoveSystem())


-----------------------------------------------------------

local BulletSystem = ns.class("BulletSystem",ns.System)

function BulletSystem:requires() return {"bullet"} end

function BulletSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local bulletInfo = entity:get("bullet")
		local movement = vec3:new(bulletInfo.speed*dt,0,0)
		entity.Transform:translate(movement)
		bulletInfo.lifetime = bulletInfo.lifetime - 1
		if(bulletInfo.lifetime <= 0) then
			--delete entity
			Manager:removeEntity(entity)
		end
	end
end

Manager:addSystem(BulletSystem())

-----------------------------------------------------------

LOG("Systems load completed", LogLevel.Info, 1)


