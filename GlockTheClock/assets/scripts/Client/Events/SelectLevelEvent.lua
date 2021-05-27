local ns = require('namespace')

ns.selectLevelEvent = ns.class("selectLevelEvent")

function ns.selectLevelEvent:initialize(level)
	self.level = level
	LOG("Firing SelectLevelEvent")
end