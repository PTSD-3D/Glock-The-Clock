local ns = require('namespace')
local prefabs = require("Prefab")

LOG("Loading systems...", LogLevel.Info, 1)
-----------------------------------------------------------
ns.deathEvent = ns.class("deathEvent")

function ns.deathEvent:initialize(player)
	self.player = player
	LOG("Firing DeathEvent")
end
-----------------------------------------------------------

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
		-- cameraSetPos(vec3:new(0,80,0))
		-- cameraLookAt(vec3:new(0,0,1000))
		--makes the camera transform child of the player transform
		if (not camChild) then
		 	tr:setChildCamera()
		 	camChild = true
		end

		--rotation + camera
		local mouseDirection = getMouseRelativePosition()
		if(mouseDirection == nil) then LOG("mdir nil",LogLevel.Critical,1) end
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
	-- local i = 0
	-- for _, entity in pairs(self.targets) do
	-- 	i = i + 1
	-- end
	-- print(i)
end


function DZSystem:onCollision(_, other, _)
	local playerComp = other:get("playerMove")
	if(playerComp ~= nil) then
		print("Player fell to DEATH")
		Manager.eventManager:fireEvent(ns.deathEvent(other))
		end
end

Manager:addSystem(DZSystem())

-----------------------------------------------------------

local RespawnSystem = ns.class("RespawnSystem",ns.System)

function RespawnSystem:onPlayerDead(event)
	if(self.spawnPoint==nil) then
		LOG("No respawn point set",LogLevel.Critical,1)
		return
	end
	local p = self.spawnPoint.Transform.position
	local nPos = vec3:new(p.x,p.y,p.z)
	local v0 = vec3:new(0,0,0)
	event.player.Rigidbody:setLinearVelocity(v0)
	event.player.Rigidbody:setAngularVelocity(v0)
	event.player.Rigidbody:setPosition(nPos)
end

function RespawnSystem:requires() return {"spawnpoint"} end

function RespawnSystem:update()
	-- local i = 0
	-- for _, entity in pairs(self.targets) do
	-- 	i = i + 1
	-- end
	-- print(i)
end

function RespawnSystem:initialize()
	ns.System.initialize(self)
	self.spawnPt = nil
	Manager.eventManager:addListener("deathEvent", self, self.onPlayerDead)
end

function RespawnSystem:onAddEntity(entity)
	-- make sure theres only one
	if(self.spawnPoint ~= nil) then 
		LOG("OOPSIE There are multiple spawn points",LogLevel.Warning,1)
	else
		self.spawnPoint = entity
		LOG("Spawnpoint detected",LogLevel.Info,1)
	end
end

Manager:addSystem(RespawnSystem())
-----------------------------------------------------------

local TargetMoveSystem = ns.class("TargetMoveSystem", ns.System)

function TargetMoveSystem:requires() return {"targetMove"} end

function TargetMoveSystem:update(dt) 
	for _, entity in pairs(self.targets) do
		local targetMove = entity:get("targetMove")
		local movement = vec3:new(targetMove.vx*dt, targetMove.vy*dt, targetMove.vz*dt)
		entity.Transform:translate(movement)
		local rotation = vec3:new(targetMove.rx*dt, targetMove.ry*dt, targetMove.rz*dt)
		entity.Transform:rotate(rotation)
	end
end

Manager:addSystem(TargetMoveSystem())
-----------------------------------------------------------

local TargetCollisionSystem = ns.class("TargetCollisionSystem", ns.System)

function TargetCollisionSystem:requires() return {"targetCollision"} end

function TargetCollisionSystem:onCollision(target, other, collision) 
	if(other:has("bullet")) then
		local targetCollision = target:get("targetCollision")
		Manager:removeEntity(target)
		LOG("Player scored " .. targetCollision.points .. " points")
	end
end

function TargetCollisionSystem:update(dt)
end

Manager:addSystem(TargetCollisionSystem())
-----------------------------------------------------------
LOG("Systems load completed", LogLevel.Info, 1)