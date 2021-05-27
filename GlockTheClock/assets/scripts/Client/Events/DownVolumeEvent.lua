local ns = require('namespace')

ns.downVolumeEvent = ns.class("downVolumeEvent")

function ns.downVolumeEvent:initialize()
	LOG("Firing DownVolumeEvent")
end