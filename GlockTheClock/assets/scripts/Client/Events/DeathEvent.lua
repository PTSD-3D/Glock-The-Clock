local ns = require('namespace')

ns.deathEvent = ns.class("deathEvent")

function ns.deathEvent:initialize(player)
	self.player = player
	LOG("Firing DeathEvent")
end