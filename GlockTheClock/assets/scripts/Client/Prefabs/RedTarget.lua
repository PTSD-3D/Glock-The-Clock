local pf = reqPrefab

function pf.RedTarget(params)
	return {
		Components = {
			{ name = "targetCollision", arguments={params.targetCollision.points}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "Target.mesh", material = "RedTarget" },
        Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=1,trigger=true,rotation=params.Transform.rotation}
	}
end