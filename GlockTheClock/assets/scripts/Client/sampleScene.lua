local prefabs = require('Prefab')
local sceneConfig = require('Prefab')
local Scene={
 Entities={	
	Goal=
	{
		Transform = {position={x=-0.0,y=2.5133743286132812,z=84.76555633544922},rotation={x=-0.0,y=0.0,z=0.0},scale={x=10,y=10,z=10}},
		Components= {
		}
    },
	Spawn=
	{
		Transform = {position={x=-0.0,y=2.5133743286132812,z=-9.152349472045898},rotation={x=-0.0,y=0.0,z=0.0},scale={x=10,y=10,z=10}},
		Components= {
			{ name = "spawnpoint", arguments = {true} }
		}
	},
	DeathZone_000=prefabs.DeadZone({
		Transform = {position={x=-0.0,y=-100,z=0},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1000,y=1.0,z=1000}}}),
	Platform_000=prefabs.Platform({
		Transform = {position={x=-0.0,y=0.0,z=-6.6010847091674805},rotation={x=-0.0,y=0.0,z=0.0},scale={x=10.905817031860352,y=1.0,z=10.831353187561035}}}),
	Platform_001=prefabs.Platform({
		Transform = {position={x=-7.747493743896484,y=0.0,z=11.914058685302734},rotation={x=-0.0,y=0.0,z=-18.05662959930421},scale={x=3.8450777530670166,y=3.651704788208008,z=3.6825337409973145}}}),
	Platform_002=prefabs.Platform({
		Transform = {position={x=4.851972579956055,y=0.0,z=23.379627227783203},rotation={x=-0.0,y=0.0,z=10.730294634208086},scale={x=3.8450777530670166,y=3.651704788208008,z=3.6825337409973145}}}),
	Platform_003=prefabs.Platform({
		Transform = {position={x=-7.747493743896484,y=0.0,z=32.83156204223633},rotation={x=-0.0,y=0.0,z=-18.05662959930421},scale={x=3.8450777530670166,y=3.651704788208008,z=3.6825337409973145}}}),
	Platform_004=prefabs.Platform({
		Transform = {position={x=-4.768166542053223,y=0.0,z=45.469566345214844},rotation={x=-26.82432145570155,y=0.0,z=-0.0},scale={x=2.203453540802002,y=1.0,z=4.325438022613525}}}),
	Platform_005=prefabs.Platform({
		Transform = {position={x=4.029995918273926,y=0.0,z=53.66787338256836},rotation={x=11.722603299847755,y=0.0,z=-0.0},scale={x=2.203453540802002,y=1.0,z=4.325438022613525}}}),
	Platform_006=prefabs.Platform({
		Transform = {position={x=-5.200106620788574,y=0.0,z=63.49094009399414},rotation={x=-23.832374165250393,y=0.0,z=-0.0},scale={x=2.203453540802002,y=1.0,z=4.325438022613525}}}),
	Platform_007=prefabs.Platform({
		Transform = {position={x=-0.0,y=0.0,z=84.19429016113281},rotation={x=-0.0,y=0.0,z=0.0},scale={x=10.905817031860352,y=1.0,z=10.831353187561035}}}),
	Player=prefabs.Player({ 
		Transform = {position={x=-0.0,y=12.5133743286132812,z=-9.152349472045898},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.521728515625,y=3.521728515625,z=3.521728515625}}
	}),
	RedTarget= prefabs.RedTarget({
		Transform = {position={x=10,y=10,z=80},rotation={x=-0.0,y=0.0,z=0.0},scale={x=5,y=5,z=0.5}},
		targetCollision = {points = 10},
		Components= {
			--{ name = "targetCollision", arguments = {10} }
		}
	}),
	BlueTarget= prefabs.BlueTarget({
		Transform = {position={x=-10,y=10,z=80},rotation={x=-0.0,y=0.0,z=0.0},scale={x=5,y=5,z=0.5}},
		targetCollision = {points = 100},
		targetMove = {vx = 0, vy = 1, vz = 0, rx = 0, ry = 10, rz = 0, distance = 0, maxDistance= 10},
		Components= {
		}
	})
    },
	SceneConfig=sceneConfig.sampleScene()
}
return Scene
