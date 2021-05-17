local ns = require('namespace')

local TargetMoveSystem = ns.class("TargetMoveSystem", ns.System)

function TargetMoveSystem:requires() return {"targetMove"} end

function TargetMoveSystem:magnitude(x, y, z)
	return math.sqrt(x*x+y*y+z*z) end

function TargetMoveSystem:trigonometry(targetMove, dt)
	local move = {}
	local trig
	for i = 1, 3 do
		if(targetMove.trig[i] == "cos") then trig = math.cos
		else trig = math.sin
		end
		--division entre 60 para que el rango sea mas intuitivo
		move[i] = targetMove.range[i]/60*targetMove.speed[i]*dt*trig(math.rad(targetMove.angle[i]))
		targetMove.angle[i] = targetMove.angle[i] + targetMove.speed[i]*dt
	end
	return vec3:new(move[1], move[2], move[3])
end

function TargetMoveSystem:update(dt) 
	for _, entity in pairs(self.targets) do
		local targetMove = entity:get("targetMove")
		entity.Transform:translate(self:trigonometry(targetMove, dt))
		local rot = {}
		for i = 1, 3 do
			rot[i] = targetMove.rotation[i]*dt
		end
		entity.Transform:rotate(vec3:new(rot[1], rot[2], rot[3]))
	end
end

Manager:addSystem(TargetMoveSystem())