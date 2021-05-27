local pf = require('Prefab')

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.DeadZone(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "death", arguments = {true} }
		},
		Transform = params.Transform,
		Mesh = {mesh="Cube.mesh", material="TransparentMat"},
		Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=true,rotation=params.Transform.rotation}
	}
end