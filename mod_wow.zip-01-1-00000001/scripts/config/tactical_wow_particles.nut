/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.07, game_version = 1.4.0.39*/
local gt = this.getroottable();

if (!("Tactical" in gt.Const))
{
	gt.Const.Tactical <- {};
}

gt.Const.Tactical.HuntersMarkParticles <- [
	{
		Delay = 0,
		Quantity = 1,
		LifeTimeQuantity = 1,
		SpawnRate = 1000,
		Brushes = [
			"anim_hunter_huntersmark"
		],
		Stages = [
			{
				LifeTimeMin = 0.5,
				LifeTimeMax = 0.5,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 1,
				ScaleMax = 1,
				SpawnOffsetMin = this.createVec(0, 100),
				SpawnOffsetMax = this.createVec(0, 100),
				ForceMin = this.createVec(0, -30),
				ForceMax = this.createVec(0, -30)
			},
			{
				LifeTimeMin = 0,
				LifeTimeMax = 0,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 1,
				ScaleMax = 1,
			}
		]
	}
	{
		Delay = 500,
		Quantity = 1,
		LifeTimeQuantity = 1,
		SpawnRate = 1000,
		Brushes = [
			"anim_hunter_huntersmark"
		],
		Stages = [
			{
				LifeTimeMin = 0.5,
				LifeTimeMax = 0.5,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 1,
				ScaleMax = 1,
				SpawnOffsetMin = this.createVec(0, 90),
				SpawnOffsetMax = this.createVec(0, 90),
				ForceMin = this.createVec(0, 30),
				ForceMax = this.createVec(0, 30)
			},
			{
				LifeTimeMin = 0,
				LifeTimeMax = 0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 1,
				ScaleMax = 1,
			}
		]
	},
];