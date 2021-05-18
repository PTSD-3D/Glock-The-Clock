local pf = require('Prefab')

--Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools

--This is a dummy for map purposes
function pf.Target (params)
	return{
		Components = {
			--Example user defined components
		},
		Transform = params.Transform,
		Mesh = {mesh="Star.mesh", material="Coleccionable"},
        Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=true,rotation=params.Transform.rotation}
	}
end