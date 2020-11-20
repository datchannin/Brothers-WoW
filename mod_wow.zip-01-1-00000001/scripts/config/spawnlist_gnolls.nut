/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Gnolls <- [
	// EQUIAL BRUTES AND ASSASSINS
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 1
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 0
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 2
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 3
			}
		]
	},
	// MORE ASSASSINS
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 1
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 0
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 2
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 3
			}
		]
	},
	// MORE BRUTES
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 1
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 0
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 2
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 3
			}
		]
	},
	// MAXIMUM ASSASSINS
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 1
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 0
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 2
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 3
			}
		]
	},
	// MAXIMUM BRUTES
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 1
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 0
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 2
			}
		]
	},
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 0
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 3
			}
		]
	}
];

function onCostCompare( _t1, _t2 )
{
	if (_t1.Cost < _t2.Cost)
	{
		return -1;
	}
	else if (_t1.Cost > _t2.Cost)
	{
		return 1;
	}

	return 0;
}

function calculateCosts( _p )
{
	foreach( p in _p )
	{
		p.Cost <- 0;

		foreach( t in p.Troops )
		{
			p.Cost += t.Type.Cost * t.Num;
		}

		if (!("MovementSpeedMult" in p))
		{
			p.MovementSpeedMult <- 1.0;
		}

		if (!("VisibilityMult" in p))
		{
			p.VisibilityMult <- 1.0;
		}

		if (!("VisionMult" in p))
		{
			p.VisionMult <- 1.0;
		}
	}

	_p.sort(this.onCostCompare);
}

this.calculateCosts(this.Const.World.Spawn.Gnolls);

