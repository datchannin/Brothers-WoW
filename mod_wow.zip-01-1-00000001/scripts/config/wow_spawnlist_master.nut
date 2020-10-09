local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Troops.GnollRookie <- {
	ID = this.Const.EntityType.GnollRookie,
	Variant = 0,
	Strength = 35,
	Cost = 35,
	Row = 1,
	Script = "scripts/entity/tactical/enemies/gnoll_rookie"
};