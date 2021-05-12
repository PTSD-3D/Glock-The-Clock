local ns = require('namespace')

--Define new components here
--ns.Component.create("compName",{"attrib1","attrib2"},{attrib1=defaultValue,attrib2=defaultValue})

LOG("Loading components...", LogLevel.Info, 1)

ns.Component.create("playerMove",{"vel","vrot","jump"})
ns.Component.create("boombox",{"volume","isPlaying","sound","channel"})
ns.Component.create("topo")
ns.Component.create("bullet",{"damage","speed","lifetime"},{damage=0,speed=3,lifetime=100})
ns.Component.create("death",{"active"},{active=true})
ns.Component.create("spawnpoint")
--lifetime is in frames

LOG("Components load completed", LogLevel.Info, 1)