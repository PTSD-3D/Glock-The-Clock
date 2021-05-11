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
local DZSystem = ns.class("DZSystem",ns.System)

function DZSystem:requires() return {"death"} end

function DZSystem:initialize()
	ns.System.initialize(self)
	self.factor = 1
end

function DZSystem:update(dt)
	local i = 0
	for _, entity in pairs(self.targets) do
		i = i + 1
	end
	print(i)
end


function DZSystem:onCollision(ent, other, col)
	print("colisionamiento")
	local playerComp = other:get("playerMove")
	if(playerComp ~= nil) then
		print("U dead")
	end
end

Manager:addSystem(DZSystem())

-----------------------------------------------------------

-- ns.deathEvent = ns.class("deathEvent")

-- function ns.deathEvent:initialize(player)
-- 	self.player = player
-- 	LOG("Firing DeathEvent")
-- end
-----------------------------------------------------------

-- ns RespawnSystem = ns.class("RespawnSystem",ns.System)

-- function onPlayerDead(event)
-- 	-- event.player.Transform:setPosition(self.spawnPoint)
-- end

-- function RespawnSystem:requires() return {"spawnpoint"} end

-- function RespawnSystem:initialize()
-- 	ns.System.initialize(self)
-- 	self.spawnPt = nil
-- 	Manager.eventManager:addListener("changePerspectiveEvent", self, self.onPlayerDead)
-- end

-- function RespawnSystem:onAddEntity(entity)
-- 	-- make sure theres only one
-- 	--TODO make this a warning
-- 	if(self.spawnPoint ~= nil) then 
-- 		LOG("OOPSIE There are multiple spawn points",LogLevel.Warning)
-- 	else
-- 		self.spawnPoint = entity
-- 		LOG("Spawnpoint detected")
-- 	end
-- end

-- Manager:addSystem(RespawnSystem())
-----------------------------------------------------------


LOG("Systems load completed", LogLevel.Info, 1)


