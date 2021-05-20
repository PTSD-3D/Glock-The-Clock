local ns = require('namespace')

local RespawnSystem = ns.class("RespawnSystem",ns.System)

function RespawnSystem:initialize()
	ns.System.initialize(self)
	Manager.eventManager:addListener("deathEvent", self, self.onPlayerDead)
	Manager.eventManager:addListener("ChangeSceneEvent", self, self.handleChangeScene)
end

function RespawnSystem:handleChangeScene(ev)
	self.spawnPoint = nil;
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