local gt = this.getroottable();

if (!("Tactical" in gt.Const))
{
	gt.Const.Tactical <- {};
}

//GruesomeFeastParticles
gt.Const.Tactical.HuntersMarkParticles <- [
	{
		Delay = 0,
		Quantity = 1,
		LifeTimeQuantity = 50,
		SpawnRate = 1000,
		Brushes = [
			"anim_hunter_huntersmark"
		],
		Stages = [
			{
				LifeTimeMin = 2.5,
				LifeTimeMax = 2.5,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 1,
				ScaleMax = 1,
				RotationMin = 0,
				RotationMax = 0,
				VelocityMin = 0,
				VelocityMax = 0,
				TorqueMin = 0,
				TorqueMax = 0,
				DirectionMin = this.createVec(0, 0),
				DirectionMax = this.createVec(0, 0),
				SpawnOffsetMin = this.createVec(0, 100),
				SpawnOffsetMax = this.createVec(0, 100),
				ForceMin = this.createVec(0, -10),
				ForceMax = this.createVec(0, -10)
			}
			{
				LifeTimeMin = 2.5,
				LifeTimeMax = 2.5,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 1,
				ScaleMax = 1,
			}
		]
	},
	{
		Delay = 5,
		Quantity = 1,
		LifeTimeQuantity = 50,
		SpawnRate = 1000,
		Brushes = [
			"anim_hunter_huntersmark"
		],
		Stages = [
			{
				LifeTimeMin = 5,
				LifeTimeMax = 5,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.7,
				ScaleMax = 0.7,
				RotationMin = 0,
				RotationMax = 0,
				VelocityMin = 0,
				VelocityMax = 0,
				TorqueMin = 0,
				TorqueMax = 0,
				DirectionMin = this.createVec(0, 0),
				DirectionMax = this.createVec(0, 0),
				SpawnOffsetMin = this.createVec(0, -10),
				SpawnOffsetMax = this.createVec(0, -10),
				ForceMin = this.createVec(0, 10),
				ForceMax = this.createVec(0, 10)
			},
		]
	}
];