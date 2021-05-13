local pf = require('Prefab')

function pf.BlueTarget(params)
	return {
		Components = {
			{ name = "targetCollision", arguments={params.targetCollision.points}},
			{ name = "targetMove", arguments={params.targetMove.vx, params.targetMove.vy, params.targetMove.vz, params.targetMove.rx, params.targetMove.ry, params.targetMove.rz}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "Target.mesh", material = "BlueTarget" },
        Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=true,rotation=params.Transform.rotation}
	}
end