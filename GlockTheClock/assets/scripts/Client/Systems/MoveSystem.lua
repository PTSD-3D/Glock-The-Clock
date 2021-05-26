local ns = require('namespace')
local prefabs = require('Prefab')
local resources = require('resources')

local MoveSystem = ns.class("MoveSystem",ns.System)

function MoveSystem:requires()
	return {"playerMove"}
end
-- MoveSystem.camChild = false;

function MoveSystem:Shoot(entity,dt)

	print(entity)
	local dest = getCamOrientation()
	local offset = entity.Transform:getForward() * 25
	local pos = entity.Transform.position - offset

	ns.spawnEntity(Manager,prefabs.Bullet({
			Transform = {
				position=pos,
				rotation={x=0.0,y=0.0,z=0.0},
				scale={x=1,y= 1,z=1}
			},
			direction = dest
		}
	))
end

function MoveSystem:initialize()
	ns.System.initialize(self)
	Manager.eventManager:addListener("ChangeSceneEvent", self, self.handleChangeScene)
end
function MoveSystem:handleChangeScene(ev)
	self.player = nil;
end
function MoveSystem:onAddEntity(entity)
	-- make sure theres only one
	if(self.player ~= nil) then 
		LOG("OOPSIE There are multiple players",LogLevel.Warning,1)
	else
		self.player = entity
		self.player.Transform:setChildCamera()
		LOG("Player detected",LogLevel.Info,1)
	end
end
function MoveSystem:update(dt)
	if (self.player ~= nil) then
		local tr = self.player.Transform
		local rb = self.player.Rigidbody
		local vel = self.player:get("playerMove").vel;
		local vr = self.player:get("playerMove").vrot;
		-- cameraSetPos(vec3:new(0,80,0))
		-- cameraLookAt(vec3:new(0,0,1000))
		--makes the camera transform child of the player transform

		--rotation + camera
		local mouseDirection = getMouseRelativePosition()
		if(mouseDirection == nil) then LOG("mdir nil",LogLevel.Critical,1) end
		mouseDirection =  mouseDirection * vr
		local rot = vec3:new(0, -mouseDirection.x, 0)
		rotateCamera(vec2:new(0, mouseDirection.y))
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
		if (keyPressed(PTSDKeys.Space) and rb:hasRayCastHit(vec3:new(0, -2, 0))) then
			--adds the force of the jump
			local force = vec3:new(0, self.player:get("playerMove").jump, 0)
			local ref = vec3:new(0, 0, 0)
			rb:addForce(force, ref)
			
			local chan = playSound(resources.Sounds.Jump.id)
			setChannelVolume(chan,1)

			--this is only necessary because the player is on the void
			vtotal.y = 0
		end

		if keyPressed(PTSDKeys.P) then
			showPauseUI()
		end
		if keyJustPressed(PTSDKeys.H) or  mouseButtonJustPressed(PTSDMouseButton.Left) then
			self:Shoot(self.player, dt)
		end
		rb:setLinearVelocity(vtotal)
	end
end

Manager:addSystem(MoveSystem())