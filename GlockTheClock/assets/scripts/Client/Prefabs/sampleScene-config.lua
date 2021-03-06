local sceneConfig = require('Prefab')
local ns = require('namespace')

function sceneConfig.sampleScene()
	return {
		PhysicsConfig = {
			Gravity = -135
		},
		GraphicsConfig = {
			LockMouse = true,
			Skybox = {
				type = 1, --ns.SkyboxTypes.Skybox
				enable = true,
				material = "Skybox",
				distance = 300
			}
		}
	}
end