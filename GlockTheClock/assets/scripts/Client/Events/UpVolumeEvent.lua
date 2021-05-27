local ns = require('namespace')

ns.upVolumeEvent = ns.class("upVolumeEvent")

function ns.upVolumeEvent:initialize()
	LOG("Firing UpVolumeEvent")
end