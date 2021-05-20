local ns = require('namespace')

local resources = require('resources')

ns.deathEvent = ns.class("deathEvent")

function ns.deathEvent:initialize(player)
	self.player = player

	local chan = playSound(resources.Sounds.Fall.id)
	setChannelVolume(chan,1)

	LOG("Firing DeathEvent")
end