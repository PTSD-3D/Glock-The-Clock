local prefabs = require('Prefab') 
local sceneConfig = require('Prefab') 
local Scene={
 Entities={	DeadZone_000=prefabs.DeadZone({
		Transform = {position={x=-80.00550842285156,y=-82.47428894042969,z=53.89710235595703},rotation={x=-0.0,y=0.0,z=0.0},scale={x=239.62814331054688,y=2.7058236598968506,z=239.62814331054688}}}),
	Goal=prefabs.Goal({
		Transform = {position={x=-205.64573669433594,y=-32.50431442260742,z=103.6405029296875},rotation={x=-0.0,y=17.96889923450998,z=-0.0},scale={x=3.0,y=3.0,z=3.0}},
		nextScene="MainMenuScene"
	}),
	
	Platform_000=prefabs.Platform({
		Transform = {position={x=40.57072448730469,y=5.99833869934082,z=-65.74286651611328},rotation={x=-0.0,y=0.0,z=0.0},scale={x=8.203365325927734,y=7.076155662536621,z=16.650272369384766}}}),
	Platform_001=prefabs.Platform({
		Transform = {position={x=13.923748970031738,y=7.114109992980957,z=28.566484451293945},rotation={x=-0.0,y=0.0,z=0.0},scale={x=39.32181930541992,y=8.686304092407227,z=12.916791915893555}}}),
	Platform_004=prefabs.Platform({
		Transform = {position={x=-40.822479248046875,y=5.998337745666504,z=35.12024688720703},rotation={x=-0.0,y=13.886864851582185,z=-0.0},scale={x=28.135780334472656,y=7.076155662536621,z=12.351634979248047}}}),
	Platform_005=prefabs.Platform({
		Transform = {position={x=-117.76792907714844,y=-18.74513053894043,z=44.807437896728516},rotation={x=-0.0,y=0.0,z=0.0},scale={x=5.818510055541992,y=17.694080352783203,z=6.036506652832031}}}),
	Platform_006=prefabs.Platform({
		Transform = {position={x=-191.4759063720703,y=-45.44322967529297,z=97.254150390625},rotation={x=-0.0,y=-24.556331528589432,z=-0.0},scale={x=19.857358932495117,y=7.076155662536621,z=20.460206985473633}}}),
	Platform_007=prefabs.Platform({
		Transform = {position={x=21.938961029052734,y=5.917888641357422,z=3.2336349487304688},rotation={x=-0.0,y=0.0,z=0.0},scale={x=5.691943168640137,y=7.076155662536621,z=6.995048999786377}}}),
	Platform_008=prefabs.Platform({
		Transform = {position={x=-89.86918640136719,y=-11.358749389648438,z=61.42493438720703},rotation={x=-0.0,y=0.0,z=0.0},scale={x=5.818510055541992,y=17.694080352783203,z=6.207578659057617}}}),
	Platform_009=prefabs.Platform({
		Transform = {position={x=-138.22267150878906,y=-29.85576629638672,z=76.95761108398438},rotation={x=-0.0,y=0.0,z=0.0},scale={x=5.818510055541992,y=17.694080352783203,z=6.1689229011535645}}}),
	Platform_010=prefabs.Platform({
		Transform = {position={x=40.57072448730469,y=19.39973258972168,z=-27.43844985961914},rotation={x=-34.442967172933066,y=0.0,z=-0.0},scale={x=9.756447792053223,y=7.272975444793701,z=27.35651969909668}}}),
	Platform_011=prefabs.Platform({
		Transform = {position={x=40.57072448730469,y=6.5040202140808105,z=3.368147373199463},rotation={x=-0.0,y=0.0,z=0.0},scale={x=12.153708457946777,y=34.264808654785156,z=12.372355461120605}}}),
	Player_000=prefabs.Player({
		Transform = {position={x=41.12141418457031,y=29.44719123840332,z=-69.62260437011719},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}}}),


	RedTarget_000=prefabs.RedTarget({
		Transform = {position={x=41.12141418457031,y=49.583518981933594,z=-6.989112854003906},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	
	RedTarget_003=prefabs.RedTarget({
		Transform = {position={x=-58.49873352050781,y=23.818458557128906,z=38.33735656738281},rotation={x=-0.0,y=-76.51781013951995,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_004=prefabs.RedTarget({
		Transform = {position={x=-99.16142272949219,y=23.818458557128906,z=68.68392944335938},rotation={x=-0.0,y=-76.51781013951995,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_005=prefabs.RedTarget({
		Transform = {position={x=-125.33181762695312,y=12.163052558898926,z=49.05666732788086},rotation={x=-0.0,y=-76.51781013951995,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_006=prefabs.RedTarget({
		Transform = {position={x=-148.17686462402344,y=-1.091653823852539,z=80.77003479003906},rotation={x=-0.0,y=-76.51781013951995,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	
	RedTarget_010=prefabs.RedTarget({
		Transform = {position={x=46.82910919189453,y=50.807373046875,z=32.55708312988281},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_011=prefabs.RedTarget({
		Transform = {position={x=34.870296478271484,y=50.807373046875,z=32.55708312988281},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_012=prefabs.RedTarget({
		Transform = {position={x=40.751678466796875,y=58.0930061340332,z=32.55708312988281},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_014=prefabs.RedTarget({
		Transform = {position={x=-28.206876754760742,y=38.894683837890625,z=31.78373146057129},rotation={x=-0.0,y=-78.01093730340894,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	BlueTarget_016=prefabs.BlueTarget({
		Transform = {position={x=30.839876174926758,y=26.45348358154297,z=61.99794006347656},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,10,0}, rotation = {0,0,0}, speed = {-55,-55,0}, trig = {"cos", "sin", "sin"}},
	}),
	BlueTarget_017=prefabs.BlueTarget({
		Transform = {position={x=4.0,y=33.68098068237305,z=61.99794006347656},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,10,0}, rotation = {0,0,0}, speed = {55,55,0}, trig = {"cos", "sin", "sin"}},
	}),
	BlueTarget_001=prefabs.BlueTarget({
		Transform = {position={x=60.47148132324219,y=28.204418182373047,z=-30.309322357177734},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,10,0}, rotation = {0,60,0}, speed = {0,0,0}, trig = {"cos", "sin", "sin"}},
	}),
	BlueTarget_002=prefabs.BlueTarget({
		Transform = {position={x=20.30221176147461,y=28.204418182373047,z=-30.660968780517578},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,10,0}, rotation = {0,60,0}, speed = {0,0,0}, trig = {"cos", "sin", "sin"}},
	}),
	BlueTarget_007=prefabs.BlueTarget({
		Transform = {position={x=-188.00662231445312,y=-25.148845672607422,z=87.65418243408203},rotation={x=-0.0,y=-76.51781013951995,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,10,0}, rotation = {0,60,0}, speed = {0,20,0}, trig = {"cos", "sin", "sin"}},
	}),

	Spawn=prefabs.Spawn({
		Transform = {position={x=41.357574462890625,y=18.937252044677734,z=-69.49696350097656},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}}}),

	Star_000=prefabs.Star({
		Transform = {position={x=23,y=18.2,z=4},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=3.0}},
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
