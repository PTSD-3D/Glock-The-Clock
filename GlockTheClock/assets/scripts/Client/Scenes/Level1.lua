local prefabs = require('Prefab') 
local sceneConfig = require('Prefab') 
local Scene={
 Entities={
	DeadZone_000=prefabs.DeadZone({
		Transform = {position={x=5.633609771728516,y=-82.47428894042969,z=38.29126739501953},rotation={x=-0.0,y=0.0,z=0.0},scale={x=239.62814331054688,y=2.7058236598968506,z=344.22125244140625}}}),
	Goal=prefabs.Goal({
		Transform = {position={x=21.114362716674805,y=4.5,z=-128.65762329101562},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=3.0}},
		nextScene="Level2"
	}),
	
	Platform_000=prefabs.Platform({
		Transform = {position={x=23.022790908813477,y=-1.426178216934204,z=-124.57026672363281},rotation={x=-0.0,y=0.0,z=0.0},scale={x=27.067033767700195,y=3.418839931488037,z=26.882200241088867}}}),
	Platform_001=prefabs.Platform({
		Transform = {position={x=-10.481081008911133,y=4.942273139953613,z=-66.37886047363281},rotation={x=-0.0,y=0.0,z=-18.05662959930421},scale={x=13.145705223083496,y=12.484593391418457,z=12.59000015258789}}}),
	Platform_002=prefabs.Platform({
		Transform = {position={x=39.98777770996094,y=1.2328073978424072,z=-27.179920196533203},rotation={x=-0.0,y=0.0,z=10.730294634208086},scale={x=13.145707130432129,y=12.484596252441406,z=12.59000015258789}}}),
	Platform_003=prefabs.Platform({
		Transform = {position={x=-10.481081008911133,y=1.8352611064910889,z=5.134733200073242},rotation={x=-0.0,y=0.0,z=-18.05662959930421},scale={x=13.145705223083496,y=12.484593391418457,z=12.59000015258789}}}),
	Platform_005=prefabs.Platform({
		Transform = {position={x=-2.514962673187256,y=-13.5,z=66.79058074951172},rotation={x=-0.0,y=0.0,z=0.0},scale={x=15.463380813598633,y=16.843358993530273,z=14.787979125976562}}}),
	Platform_006=prefabs.Platform({
		Transform = {position={x=-24.29771614074707,y=-3.4604761600494385,z=120.68727111816406},rotation={x=-0.0,y=0.0,z=0.0},scale={x=14.57291316986084,y=3.418839931488037,z=49.98813247680664}}}),
	Platform_007=prefabs.Platform({
		Transform = {position={x=-3.769491195678711,y=-16.49905014038086,z=187.47052001953125},rotation={x=-0.0,y=0.0,z=0.0},scale={x=37.28524398803711,y=17.454099655151367,z=17.637300491333008}}}),
	Platform_008=prefabs.Platform({
		Transform = {position={x=8.805978775024414,y=-10.0,z=46.015506744384766},rotation={x=-0.0,y=0.0,z=0.0},scale={x=15.463380813598633,y=16.843358993530273,z=14.787979125976562}}}),
	Platform_009=prefabs.Platform({
		Transform = {position={x=17.52857208251953,y=-1.4400780200958252,z=132.81504821777344},rotation={x=-0.0,y=26.2495559144031,z=-0.0},scale={x=8.705864906311035,y=3.418839931488037,z=22.141054153442383}}}),
	Player_000=prefabs.Player({
		Transform = {position={x=-5.677920341491699,y=26.57253646850586,z=185.5912322998047},rotation={x=-0.0,y=180.00000500895632,z=0.0},scale={x=1.133812665939331,y=1.133812665939331,z=1.133812665939331}}}),
	
	RedTarget_000=prefabs.RedTarget({
		Transform = {position={x=-22.81547737121582,y=14.161200523376465,z=148.68373107910156},rotation={x=-0.0,y=15.099999509503892,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_001=prefabs.RedTarget({
		Transform = {position={x=-22.81547737121582,y=14.161200523376465,z=112.12615966796875},rotation={x=-0.0,y=26.799997444519843,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_002=prefabs.RedTarget({
		Transform = {position={x=7.344754219055176,y=26.882442474365234,z=31.348953247070312},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_003=prefabs.RedTarget({
		Transform = {position={x=6.272226333618164,y=14.161200523376465,z=103.31787109375},rotation={x=-0.0,y=-30.299996403551354,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_004=prefabs.RedTarget({
		Transform = {position={x=60.622310638427734,y=26.882442474365234,z=-26.534053802490234},rotation={x=-0.0,y=-38.6999986863594,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_005=prefabs.RedTarget({
		Transform = {position={x=-23.898284912109375,y=26.8824405670166,z=-95.67400360107422},rotation={x=-0.0,y=28.399998285899304,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_006=prefabs.RedTarget({
		Transform = {position={x=20.970195770263672,y=15.543571472167969,z=-154.2456817626953},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_007=prefabs.RedTarget({
		Transform = {position={x=6.142756462097168,y=24.739269256591797,z=-154.2456817626953},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_008=prefabs.RedTarget({
		Transform = {position={x=35.69674301147461,y=24.856056213378906,z=-154.2456817626953},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_009=prefabs.RedTarget({
		Transform = {position={x=6.551496505737305,y=46.71241760253906,z=-154.2456817626953},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_010=prefabs.RedTarget({
		Transform = {position={x=34.210487365722656,y=47.03630828857422,z=-154.2456817626953},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_011=prefabs.RedTarget({
		Transform = {position={x=20.590848922729492,y=42.84619140625,z=-154.2456817626953},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_012=prefabs.RedTarget({
		Transform = {position={x=-0.9169659614562988,y=35.776123046875,z=-154.2456817626953},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),
	RedTarget_013=prefabs.RedTarget({
		Transform = {position={x=43.77320861816406,y=35.776123046875,z=-154.2456817626953},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 10},
	}),

	BlueTarget_000=prefabs.BlueTarget({
		Transform = {position={x=14.473367691040039,y=25.45262908935547,z=-10.659574508666992},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,10,0}, rotation = {0,0,0}, speed = {30,30,0}, trig = {"cos", "sin", "sin"}},
	}),
	BlueTarget_001=prefabs.BlueTarget({
		Transform = {position={x=14.473367691040039,y=25.45262908935547,z=-49.367271423339844},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,10,0}, rotation = {0,0,0}, speed = {50,50,0}, trig = {"cos", "sin", "sin"}},
	}),
	BlueTarget_002=prefabs.BlueTarget({
		Transform = {position={x=14.473367691040039,y=25.45262908935547,z=-88.66156005859375},rotation={x=-0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=0.5}},
		targetCollision = {points = 30},
		targetMove = {range = {10,10,0}, rotation = {0,0,0}, speed = {70,70,0}, trig = {"cos", "sin", "sin"}},
	}),

	Spawn_000=prefabs.Spawn({
		Transform = {position={x=-5.677920341491699,y=4.616865158081055,z=188.43679809570312},rotation={x=-0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}}}),
	
	Star_000=prefabs.Star({
		Transform = {position={x=17.64022445678711,y=10.896371841430664,z=133.2301788330078},rotation={x=-0.0,y=26.2495559144031,z=-0.0},scale={x=3.0,y=3.0,z=3.0}},
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
