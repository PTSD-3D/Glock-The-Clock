local sceneConfig = require('Prefab')
local ns = require('namespace')

function sceneConfig.sampleScene()
	return {
		PhysicsConfig = {
			Gravity = -250
		},
		GraphicsConfig = {
			LockMouse = true,
			Skybox = {
				type = 1, --ns.SkyboxTypes.Skybox
				enable = true,
				material = "KirbyMat",
				distance = 300
			}
		}
	}
end