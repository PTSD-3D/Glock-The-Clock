local pf = require('Prefab')

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.Player(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "playerMove", arguments = { 100, 1.5, 2000 } }
		},
		Transform = params.Transform,
        Rigidbody = {size={x=1,y=1,z=1},mass=1,position={x=0,y=0,z=0},type=0,trigger=false,rotation={x=0,y=0,z=0,w=1}},
	    Mesh = { mesh = "Cube.mesh", material = "body" }
	}
end