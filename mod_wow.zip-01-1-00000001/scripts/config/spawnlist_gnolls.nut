/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
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
	{
		Body = "figure_wildman_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GnollBrute,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollAssassin,
				Num = 3
			}
			{
				Type = this.Const.World.Spawn.Troops.GnollPoacher,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollShaman,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.GnollMystic,
				Num = 2
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

