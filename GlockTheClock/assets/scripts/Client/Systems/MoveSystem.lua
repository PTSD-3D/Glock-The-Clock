local ns = require('namespace')
local prefabs = require('Prefab')
local resources = require('resources')

local MoveSystem = ns.class("MoveSystem",ns.System)

function MoveSystem:requires()
	return {"playerMove"}
end
-- MoveSystem.camChild = false;

function MoveSystem:Shoot()
	local dest = getCamDirection()
	--local dest = vec3:new(self.player.Transform:getForward().x, getCamDirection().y, self.player.Transform:getForward().z)
	--local offset = dest * 25
	local pos = getCamPosition() --+ offset
	local rot = getCamOrientation()

	ns.spawnEntity(Manager,prefabs.Bullet({
			Transform = {
				position=pos,	
				--190 is to see the bullet model better, 180 just shows the back part of the bullet
				rotation={x= 190 + rot.x, y = rot.y, z = 190 + rot.z},
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
	if(ev.newSceneName == "MainMenuScene") then
		showMainMenuUI()
		hideHUD()
	end
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
		local vel = self.player:get("playerMove").vel
		local vr = self.player:get("playerMove").vrot
		local maxVelChange = self.player:get("playerMove").maxVelChange

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
		local velChange = vtotal - rb:getLinearVelocity();
		--clamp
		if (velChange.x > maxVelChange) then
			velChange.x = maxVelChange
		elseif (velChange.x < -maxVelChange) then
			velChange.x = -maxVelChange
		end

		if (velChange.z > maxVelChange) then
			velChange.z = maxVelChange
		elseif (velChange.z < -maxVelChange) then
			velChange.z = -maxVelChange
		end
		velChange.y = 0;

		rb:addForce(velChange, vec3:new(0,0 ,0))



		--making sure the jump isn't overwritten
		--vtotal.y = rb:getLinearVelocity().y

		--Needs to check if the rb is on the ground, we can use a downwards raycast or the collision normals to see if it's the ground
		--the raycast checks the distance to the ground and the vtotal comparation is to avoid doing this two or three times per space press
		--even though it doesn't change how the jump works, it would play the sound track multiple times
		if (keyPressed(PTSDKeys.Space) and rb:hasRayCastHit(vec3:new(0, -2, 0)) and rb:getLinearVelocity().y <= 1) then
			--adds the force of the jump
			local force = vec3:new(0, self.player:get("playerMove").jump, 0)
			rb:addForce(force, vec3:new(0, 0, 0))
			
			local chan = playSound(resources.Sounds.Jump.id)
			setChannelVolume(chan,1)

			--this is for safety, to avoid accumulating forces if the condition above goes wrong somehow
			vtotal.y = 0
		end

		if keyPressed(PTSDKeys.P) then
			hideHUD()
			showPauseUI()
		end
		if keyJustPressed(PTSDKeys.H) or  mouseButtonJustPressed(PTSDMouseButton.Left) then
			self:Shoot()
		end
		--rb:setLinearVelocity(vtotal)
	end
end

Manager:addSystem(MoveSystem())