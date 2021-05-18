--New systems are to be required here for loading

LOG("Loading systems...", LogLevel.Info, 1)

require('MoveSystem')
require('DeathzoneSystem')
require('RespawnSystem')
require('TargetMoveSystem')
require('TargetCollisionSystem')
require('SoundSystem')
require('GoalSystem')
require('BulletSystem') --Currently not used

LOG("Systems load completed", LogLevel.Info, 1)