local ns = require('namespace')
local prefabs = require('Prefab')
local resources = require('resources')

local MoveSystem = ns.class("MoveSystem",ns.System)

function MoveSystem:requires()
	return {"playerMove"}
end
-- MoveSystem.camChild = false;

function MoveSystem:Shoot(entity,dt)

	local dest = getCamOrientation()
	
	ns.spawnEntity(Manager,prefabs.Bullet({
			Transform = {
				position={x=entity.Transform.position.x,y=entity.Transform.position.y,z=entity.Transform.position.z-25},
				rotation={x=0.0,y=0.0,z=0.0},
				scale={x=1,y= 1,z=1}
			},
			direction = dest
		}
	))
end

function MoveSystem:initialize()
	ns.System.initialize(self)
	self.camChild = false;
	Manager.eventManager:addListener("ChangeSceneEvent", self, self.handleChangeScene)
end
function MoveSystem:handleChangeScene(ev)
	self.camChild = false;
end
function MoveSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local tr = entity.Transform
		local rb = entity.Rigidbody
		local vel = entity:get("playerMove").vel;
		local vr = entity:get("playerMove").vrot;
		-- cameraSetPos(vec3:new(0,80,0))
		-- cameraLookAt(vec3:new(0,0,1000))
		--makes the camera transform child of the player transform
		if (not self.camChild) then
		 	tr:setChildCamera()
		 	self.camChild = true
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
		if (keyPressed(PTSDKeys.Space) and rb:hasRayCastHit(vec3:new(0, -2, 0))) then
			--adds the force of the jump
			local force = vec3:new(0, entity:get("playerMove").jump, 0)
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
			self:Shoot(entity, dt)
		end
		rb:setLinearVelocity(vtotal)

	end
end

Manager:addSystem(MoveSystem())