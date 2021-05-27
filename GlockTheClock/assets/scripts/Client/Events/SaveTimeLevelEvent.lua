local ns = require('namespace')

ns.saveTimeLevelEvent = ns.class("saveTimeLevelEvent")

function ns.saveTimeLevelEvent:initialize(time)
	self.time = time
	LOG("Firing SaveTimeLevelEvent")
end