local ns = require('namespace')

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

MoveSystem.camChild = false;

function MoveSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local tr = entity.Transform
		local rb = entity.Rigidbody
		local vel = entity:get("playerMove").vel;
		local vr = entity:get("playerMove").vrot;

		--makes the camera transform child of the player transform
		if (not self.camChild) then
		 	tr:setChildCamera()
		 	self.camChild = true
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

		if (keyPressed(PTSDKeys.Space) and rb:hasRayCastHit(vec3:new(0, -2, 0))) then
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
-----------------------------------------------------------

local RespawnSystem = ns.class("RespawnSystem",ns.System)

function RespawnSystem:initialize()
	ns.System.initialize(self)
	Manager.eventManager:addListener("deathEvent", self, self.onPlayerDead)
end

function RespawnSystem:requires() return {"spawnpoint"} end

-- ns.nonexisting("Hope we blow up")

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

LOG("Systems load completed", LogLevel.Info, 1)


