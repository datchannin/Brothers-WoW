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
	Row = 0,
	Script = "scripts/entity/tactical/enemies/gnoll_rookie"
};

gt.Const.World.Spawn.Troops.GnollPoacher <- {
	ID = this.Const.EntityType.GnollPoacher,
	Variant = 0,
	Strength = 45,
	Cost = 45,
	Row = 1,
	Script = "scripts/entity/tactical/enemies/gnoll_poacher"
};

gt.Const.World.Spawn.Troops.GnollShaman <- {
	ID = this.Const.EntityType.GnollShaman,
	Variant = 0,
	Strength = 45,
	Cost = 45,
	Row = 2,
	Script = "scripts/entity/tactical/enemies/gnoll_shaman"
};

gt.Const.World.Spawn.Troops.GnollMystic <- {
	ID = this.Const.EntityType.GnollMystic,
	Variant = 0,
	Strength = 45,
	Cost = 45,
	Row = 1,
	Script = "scripts/entity/tactical/enemies/gnoll_mystic"
};

gt.Const.World.Spawn.Troops.GnollAssassin <- {
	ID = this.Const.EntityType.GnollAssassin,
	Variant = 0,
	Strength = 55,
	Cost = 55,
	Row = 0,
	Script = "scripts/entity/tactical/enemies/gnoll_assassin"
};