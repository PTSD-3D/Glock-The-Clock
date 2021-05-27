local pf = require('Prefab')

local resources = require('resources')

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.Player(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "playerMove", arguments = { 100, 0.1, 2000, 4 } },
			{ name = "boombox", arguments={0.5, false, resources.Sounds.Level1Theme, -1}}
		},
		Transform = params.Transform,
        Rigidbody = {size={x=1,y=1,z=1},mass=1,position={x=0,y=0,z=0},type=0,trigger=false,rotation={x=0,y=0,z=0,w=1}},
	    Mesh = { mesh = "Cube.mesh", material = "body" }
	}
end