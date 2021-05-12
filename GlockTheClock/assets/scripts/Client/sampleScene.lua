local prefabs = require('Prefab')
local Scene={
 Entities={	
	Start=
        {
		Transform = {position={x=-34.03219223022461,y=-82.47428894042969,z=53.89710235595703},rotation={x=-0.0,y=0.0,z=0.0},scale={x=239.62815856933594,y=1.0,z=239.62815856933594}},
            Components= {
            }
        }
        ,
	Goal=
        {
		Transform = {position={x=-75.55284881591797,y=18.937252044677734,z=130.92279052734375},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
    },
	Platform_000=prefabs.Platform({
		Transform = {position={x=-0.0,y=0.0,z=-6.6010847091674805},rotation={x=-0.0,y=0.0,z=0.0},scale={x=10.905817031860352,y=1.0,z=10.831353187561035}}}),
	Platform_001=prefabs.Platform({
		Transform = {position={x=-7.747493743896484,y=0.0,z=11.914058685302734},rotation={x=-0.0,y=0.0,z=-18.05662959930421},scale={x=3.8450777530670166,y=3.651704788208008,z=3.6825337409973145}}}),
	Platform_002=prefabs.Platform({
		Transform = {position={x=4.851972579956055,y=0.0,z=23.379627227783203},rotation={x=-0.0,y=0.0,z=10.730294634208086},scale={x=3.8450777530670166,y=3.651704788208008,z=3.6825337409973145}}}),
	Platform_003=prefabs.Platform({
		Transform = {position={x=-7.747493743896484,y=0.0,z=32.83156204223633},rotation={x=-0.0,y=0.0,z=-18.05662959930421},scale={x=3.8450777530670166,y=3.651704788208008,z=3.6825337409973145}}}),
	Platform_004=prefabs.Platform({
		Transform = {position={x=-64.37274932861328,y=5.99833869934082,z=27.568830490112305},rotation={x=-0.0,y=0.0,z=0.0},scale={x=24.096054077148438,y=7.076155662536621,z=12.35163688659668}}}),
	Platform_005=prefabs.Platform({
		Transform = {position={x=-74.93299865722656,y=-4.676860809326172,z=52.011505126953125},rotation={x=-0.0,y=0.0,z=0.0},scale={x=13.536832809448242,y=17.694080352783203,z=12.35163688659668}}}),
	Platform_006=prefabs.Platform({
		Transform = {position={x=-5.200106620788574,y=0.0,z=63.49094009399414},rotation={x=-23.832374165250393,y=0.0,z=-0.0},scale={x=2.203453540802002,y=1.0,z=4.325438022613525}}}),
	Platform_007=prefabs.Platform({
		Transform = {position={x=-0.0,y=0.0,z=84.19429016113281},rotation={x=-0.0,y=0.0,z=0.0},scale={x=10.905817031860352,y=1.0,z=10.831353187561035}}}),
	Player=prefabs.Player({ 
		Transform = {position={x=-0.0,y=2.5133743286132812,z=-9.152349472045898},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1,y=1,z=1}}
	}),
    },
		SceneConfig=
        {
        PhysicsConfig={
            Gravity = -55
        }
    }
}
return Scene
