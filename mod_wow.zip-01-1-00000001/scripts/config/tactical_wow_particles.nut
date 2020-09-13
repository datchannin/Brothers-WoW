/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
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

gt.Const.Tactical.SoulParticles <- [
	{
		Delay = 0,
		Quantity = 200,
		LifeTimeQuantity = 200,
		SpawnRate = 156,
		Brushes = [
			"soul_01",
			"soul_02"
		],
		Stages = [
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.1,
				ColorMin = this.createColor("fffffff00"),
				ColorMax = this.createColor("fffffff00"),
				ScaleMin = 0.25,
				ScaleMax = 0.5,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.1, -0.9),
				DirectionMax = this.createVec(0.1, -0.9),
				SpawnOffsetMin = this.createVec(-10, 30),
				SpawnOffsetMax = this.createVec(10, 30),
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			},
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.3,
				ColorMin = this.createColor("fffffffe0"),
				ColorMax = this.createColor("ffffffff0"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.2, -0.9),
				DirectionMax = this.createVec(0.2, -0.9),
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			},
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.3,
				ColorMin = this.createColor("ffffffe0"),
				ColorMax = this.createColor("ffffffe0"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			},
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.2,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.75,
				ScaleMax = 1.0,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			}
		]
	}
];

gt.Const.Tactical.StaminaParticles <- [
	{
		Delay = 0,
		Quantity = 200,
		LifeTimeQuantity = 200,
		SpawnRate = 156,
		Brushes = [
			"stamina_01",
			"stamina_02"
		],
		Stages = [
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.1,
				ColorMin = this.createColor("fffffff00"),
				ColorMax = this.createColor("fffffff00"),
				ScaleMin = 0.25,
				ScaleMax = 0.5,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.1, -0.9),
				DirectionMax = this.createVec(0.1, -0.9),
				SpawnOffsetMin = this.createVec(-10, 30),
				SpawnOffsetMax = this.createVec(10, 30),
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			},
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.3,
				ColorMin = this.createColor("fffffffe0"),
				ColorMax = this.createColor("ffffffff0"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.2, -0.9),
				DirectionMax = this.createVec(0.2, -0.9),
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			},
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.3,
				ColorMin = this.createColor("ffffffe0"),
				ColorMax = this.createColor("ffffffe0"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			},
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.2,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.75,
				ScaleMax = 1.0,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			}
		]
	}
];

gt.Const.Tactical.LifeParticles <- [
	{
		Delay = 0,
		Quantity = 200,
		LifeTimeQuantity = 200,
		SpawnRate = 156,
		Brushes = [
			"life_01",
			"life_02"
		],
		Stages = [
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.1,
				ColorMin = this.createColor("fffffff00"),
				ColorMax = this.createColor("fffffff00"),
				ScaleMin = 0.25,
				ScaleMax = 0.5,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.1, -0.9),
				DirectionMax = this.createVec(0.1, -0.9),
				SpawnOffsetMin = this.createVec(-10, 30),
				SpawnOffsetMax = this.createVec(10, 30),
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			},
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.3,
				ColorMin = this.createColor("fffffffe0"),
				ColorMax = this.createColor("ffffffff0"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.2, -0.9),
				DirectionMax = this.createVec(0.2, -0.9),
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			},
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.3,
				ColorMin = this.createColor("ffffffe0"),
				ColorMax = this.createColor("ffffffe0"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			},
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.2,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.75,
				ScaleMax = 1.0,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 220),
				ForceMax = this.createVec(0, 220)
			}
		]
	}
];