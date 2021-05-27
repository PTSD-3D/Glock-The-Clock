local pf = require('Prefab')

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.Bullet(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "bullet", arguments = {1,1000,100, params.direction} }
		},
		Transform = { 
			position= params.Transform.position,
			rotation=params.Transform.rotation,
			scale={x=0.4,y=0.4,z=0.4}
		},
		Mesh = { mesh = "Bala.mesh", material = "BalaPayum" },
		Rigidbody = {size={x=params.Transform.scale.x,y=params.Transform.scale.y,z=params.Transform.scale.z*10},mass=1,position=params.Transform.position,type=0,trigger=true,rotation=params.Transform.rotation}
	}
end