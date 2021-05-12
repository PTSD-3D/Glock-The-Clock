local prefabs = reqPrefab 
local sceneConfig = reqSceneConfigurations 
local Scene={
 Entities={	DeadZone_000=
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
        }
        ,
	Platform_000=prefabs.Platform({
		Transform = {position={x=8.54847526550293,y=5.99833869934082,z=2.9981048107147217},rotation={x=-0.0,y=0.0,z=0.0},scale={x=12.153708457946777,y=7.076155662536621,z=38.19001388549805}}}),
	Platform_001=prefabs.Platform({
		Transform = {position={x=-12.57829475402832,y=7.114109992980957,z=28.22423553466797},rotation={x=-0.0,y=0.0,z=0.0},scale={x=9.036219596862793,y=8.686304092407227,z=12.916791915893555}}}),
	Platform_002=prefabs.Platform({
		Transform = {position={x=-15.10509967803955,y=4.151261329650879,z=10.331682205200195},rotation={x=-0.0,y=0.0,z=24.997397824432174},scale={x=14.19107437133789,y=3.117192029953003,z=5.002722263336182}}}),
	Platform_003=prefabs.Platform({
		Transform = {position={x=-31.435943603515625,y=-9.390616416931152,z=26.029457092285156},rotation={x=-0.0,y=0.0,z=0.0},scale={x=9.380753517150879,y=10.277482986450195,z=21.946231842041016}}}),
	Platform_004=prefabs.Platform({
		Transform = {position={x=-64.37274932861328,y=5.99833869934082,z=27.568830490112305},rotation={x=-0.0,y=0.0,z=0.0},scale={x=24.096054077148438,y=7.076155662536621,z=12.35163688659668}}}),
	Platform_005=prefabs.Platform({
		Transform = {position={x=-74.93299865722656,y=-4.676860809326172,z=52.011505126953125},rotation={x=-0.0,y=0.0,z=0.0},scale={x=13.536832809448242,y=17.694080352783203,z=12.35163688659668}}}),
	Platform_006=prefabs.Platform({
		Transform = {position={x=-74.93299865722656,y=5.99833869934082,z=115.08952331542969},rotation={x=-0.0,y=0.0,z=0.0},scale={x=13.536832809448242,y=7.076155662536621,z=27.246719360351562}}}),
	Spawn=
        {
		Transform = {position={x=9.335329055786133,y=18.937252044677734,z=-21.237735748291016},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
        }
        ,
	Star_000=prefabs.Star({
		Transform = {position={x=-25.016244888305664,y=6.011415004730225,z=35.112457275390625},rotation={x=-0.0,y=0.0,z=90.00000250447816},scale={x=1.530989408493042,y=1.530989408493042,z=1.530989408493042}}}),
	Target_000=
        {
		Transform = {position={x=9.099167823791504,y=18.09440040588379,z=-2.6706790924072266},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
        }
        ,
	Target_001=
        {
		Transform = {position={x=14.165214538574219,y=18.09440040588379,z=18.393634796142578},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
        }
        ,
	Target_002=
        {
		Transform = {position={x=4.155189514160156,y=18.09440040588379,z=18.041988372802734},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
        }
        ,
	Target_003=
        {
		Transform = {position={x=-24.918935775756836,y=23.818458557128906,z=26.3292236328125},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
        }
        ,
	Target_004=
        {
		Transform = {position={x=-34.626441955566406,y=29.45375633239746,z=26.3292236328125},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
        }
        ,
	Target_005=
        {
		Transform = {position={x=-43.466041564941406,y=23.465904235839844,z=26.3292236328125},rotation={x=-0.0,y=0.0,z=-90.00000250447816},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
        }
        ,
	Target_006=
        {
		Transform = {position={x=-75.82684326171875,y=23.737550735473633,z=65.14886474609375},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
        }
        ,
	Target_007=
        {
		Transform = {position={x=-75.82684326171875,y=29.54666519165039,z=76.53772735595703},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
        }
        ,
	Target_008=
        {
		Transform = {position={x=-75.82684326171875,y=20.084461212158203,z=107.09172821044922},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
        }
        },
		SceneConfig=
        {
        PhysicsConfig={
            Gravity = 5
        }
    }
}
return Scene
