--New systems are to be required here for loading

LOG("Loading systems...", LogLevel.Info, 1)

require('MoveSystem')
require('DeathzoneSystem')
require('RespawnSystem')
require('TargetMoveSystem')
require('TargetCollisionSystem')

LOG("Systems load completed", LogLevel.Info, 1)