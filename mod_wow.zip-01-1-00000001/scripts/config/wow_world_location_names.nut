/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("WarcraftLocationNames" in gt.Const.World))
{
	gt.Const.World.WarcraftLocationNames <- {};
}

gt.Const.World.WarcraftLocationNames.GnollCamp <- [
	"Blackpaw Clan Huts",
	"Palemane Tribe Hideout",
	"Palemane Huts",
	"Riverpaw Cover",
	"Riverpaw Shacks",
	"Woodpaw Clan Shelter",
	"Wildpaw Huts",
	"Wildpaw Hovels",
	"Mosshide Tribe Outpost",
	"Grimtail Clan Outpost"
];

