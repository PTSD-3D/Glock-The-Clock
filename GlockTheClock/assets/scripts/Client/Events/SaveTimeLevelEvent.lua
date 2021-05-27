local ns = require('namespace')

ns.saveTimeLevelEvent = ns.class("saveTimeLevelEvent")

function ns.saveTimeLevelEvent:initialize(mins, secs)
	self.mins = mins
	self.secs = secs
	LOG("Firing SaveTimeLevelEvent")
end