local ns = require('namespace')

ns.goalEvent = ns.class("goalEvent")

function ns.goalEvent:initialize(player)
	self.player = player
	LOG("Firing GoalEvent")
end