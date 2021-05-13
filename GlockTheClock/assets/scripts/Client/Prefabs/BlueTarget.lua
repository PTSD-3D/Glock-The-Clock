local pf = require('Prefab')

function pf.BlueTarget(params)
	return {
		Components = {
			{ name = "targetCollision", arguments={params.targetCollision.points}},
			{ name = "targetMove", arguments={params.targetMove.range,
			params.targetMove.rotation, params.targetMove.speed,
			params.targetMove.trig, {0,0,0}}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "Target.mesh", material = "BlueTarget" },
        Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=true,rotation=params.Transform.rotation}
	}
end