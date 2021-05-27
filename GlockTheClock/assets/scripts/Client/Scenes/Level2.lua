local prefabs = require('Prefab') 
local sceneConfig = require('Prefab') 
local Scene={
 Entities={	DeadZone_000=prefabs.DeadZone({
		Transform = {position={x=-34.03219223022461,y=-82.47428894042969,z=53.89710235595703},rotation={x=-0.0,y=0.0,z=0.0},scale={x=239.62814331054688,y=2.7058236598968506,z=239.62814331054688}}}),
	Goal=prefabs.Goal({
		Transform = {position={x=-87.77423858642578,y=6,z=164.6969757080078},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=3.0}},
		nextScene="Level3"
	}),
	Platform_000=prefabs.Platform({
		Transform = {position={x=40.57072448730469,y=5.99833869934082,z=-19.997583389282227},rotation={x=-0.0,y=0.0,z=0.0},scale={x=12.153708457946777,y=7.076155662536621,z=61.460819244384766}}
	}),
	Platform_001=prefabs.Platform({
		Transform = {position={x=3.1944422721862793,y=7.114109992980957,z=28.22423553466797},rotation={x=-0.0,y=0.0,z=0.0},scale={x=25.66901969909668,y=8.686304092407227,z=12.916791915893555}}}),
	Platform_002=prefabs.Platform({
		Transform = {position={x=-8.657063484191895,y=4.902084827423096,z=8.892407417297363},rotation={x=-0.0,y=0.0,z=24.997397824432174},scale={x=18.368900299072266,y=3.4506452083587646,z=5.537875175476074}}}),
	Platform_003=prefabs.Platform({
		Transform = {position={x=-38.63584899902344,y=-9.390616416931152,z=26.216028213500977},rotation={x=-0.0,y=0.0,z=0.0},scale={x=16.17233657836914,y=10.277482986450195,z=21.946231842041016}}}),
	Platform_004=prefabs.Platform({
		Transform = {position={x=-76.5941390991211,y=5.99833869934082,z=27.568830490112305},rotation={x=-0.0,y=0.0,z=0.0},scale={x=24.096054077148438,y=7.076155662536621,z=12.35163688659668}}}),
	Platform_005=prefabs.Platform({
		Transform = {position={x=-87.15438842773438,y=1.8424949645996094,z=59.673702239990234},rotation={x=-0.0,y=0.0,z=0.0},scale={x=13.536832809448242,y=17.694080352783203,z=6.455698013305664}}}),
	Platform_006=prefabs.Platform({
		Transform = {position={x=-87.15438842773438,y=-3.809164047241211,z=148.86370849609375},rotation={x=-0.0,y=0.0,z=0.0},scale={x=13.536832809448242,y=7.076155662536621,z=27.246719360351562}}}),
	Platform_007=prefabs.Platform({
		Transform = {position={x=17.7084903717041,y=8.755664825439453,z=9.60987663269043},rotation={x=-0.0,y=0.0,z=0.0},scale={x=11.117073059082031,y=7.076155662536621,z=6.0115766525268555}}}),
	Platform_008=prefabs.Platform({
		Transform = {position={x=-87.15438842773438,y=-1.6509451866149902,z=46.617916107177734},rotation={x=-0.0,y=0.0,z=0.0},scale={x=13.536832809448242,y=17.694080352783203,z=5.196263790130615}}}),
	Platform_009=prefabs.Platform({
		Transform = {position={x=-87.15438842773438,y=4.70130729675293,z=74.60023498535156},rotation={x=-0.0,y=0.0,z=0.0},scale={x=13.536832809448242,y=17.694080352783203,z=6.626018047332764}}}),
	Player_000=prefabs.Player({
		Transform = {position={x=41.12141418457031,y=29.44719123840332,z=-69.62260437011719},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}}}),

	RedTarget_000=prefabs.RedTarget({
		Transform = {position={x=41.12141418457031,y=18.09440040588379,z=-44.53279113769531},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_001=prefabs.RedTarget({
		Transform = {position={x=46.187461853027344,y=18.09440040588379,z=-5.158542633056641},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_002=prefabs.RedTarget({
		Transform = {position={x=36.17743682861328,y=18.09440040588379,z=-5.510189056396484},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),

	BlueTarget_003=prefabs.BlueTarget({
		Transform = {position={x=-24.918935775756836,y=23.818458557128906,z=26.3292236328125},rotation={x=-0.0,y=-90.00000250447816,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,5,0}, rotation = {0,40,0}, speed = {0,20,0}, trig = {"cos", "sin", "sin"}},
	}),
	BlueTarget_004=prefabs.BlueTarget({
		Transform = {position={x=-34.626441955566406,y=29.45375633239746,z=26.3292236328125},rotation={x=-0.0,y=-90.00000250447816,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,5,0}, rotation = {0,40,0}, speed = {0,40,0}, trig = {"cos", "sin", "sin"}},	
	}),
	BlueTarget_005=prefabs.BlueTarget({
		Transform = {position={x=-43.466041564941406,y=23.465904235839844,z=26.3292236328125},rotation={x=-0.0,y=-90.00000250447816,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,5,0}, rotation = {0,40,0}, speed = {0,60,0}, trig = {"cos", "sin", "sin"}},
	}),

	BlueTarget_006=prefabs.BlueTarget({
		Transform = {position={x=-88.04823303222656,y=30.256906509399414,z=83.13591003417969},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {8,8,0}, rotation = {0,0,0}, speed = {40,40,0}, trig = {"cos", "sin", "sin"}},
	}),
	BlueTarget_007=prefabs.BlueTarget({
		Transform = {position={x=-88.04823303222656,y=36.74729919433594,z=97.96111297607422},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,10,0}, rotation = {0,0,0}, speed = {50,50,0}, trig = {"cos", "sin", "sin"}},
	}),
	BlueTarget_009=prefabs.BlueTarget({
		Transform = {position={x=-88.04823303222656,y=29.6544246673584,z=112.58760070800781},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {15,15,0}, rotation = {0,0,0}, speed = {60,60,0}, trig = {"cos", "sin", "sin"}},
	}),

	BlueTarget_008=prefabs.BlueTarget({
		Transform = {position={x=-88.04823303222656,y=10.276958465576172,z=140.86590576171875},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {3,8,0}, rotation = {0,60,0}, speed = {15,40,0}, trig = {"cos", "sin", "sin"}},
	}),
	RedTarget_010=prefabs.RedTarget({
		Transform = {position={x=40.751678466796875,y=18.09440040588379,z=20.259967803955078},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_012=prefabs.RedTarget({
		Transform = {position={x=40.751678466796875,y=27.001758575439453,z=20.259967803955078},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_013=prefabs.RedTarget({
		Transform = {position={x=18.984834671020508,y=23.818458557128906,z=26.3292236328125},rotation={x=-0.0,y=-90.00000250447816,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_014=prefabs.RedTarget({
		Transform = {position={x=-2.0875587463378906,y=23.818458557128906,z=26.3292236328125},rotation={x=-0.0,y=-90.00000250447816,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_015=prefabs.RedTarget({
		Transform = {position={x=-88.04823303222656,y=28.414262771606445,z=39.51456832885742},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	Spawn=prefabs.Spawn({
		Transform = {position={x=41.357574462890625,y=18.937252044677734,z=-69.49696350097656},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}},
		Components= {
			{ name = "spawnpoint", arguments = {true} }
		}
	}),
	Star_000=prefabs.Star({
		Transform = {position={x=-26.47929573059082,y=6.011415004730225,z=35.112457275390625},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.004072904586792,y=3.004072904586792,z=3.004072904586792}},
		targetCollision = {points = 250},
	})},
		SceneConfig=
        {
        PhysicsConfig={
            Gravity = -90
        }
    }
}
return Scene
