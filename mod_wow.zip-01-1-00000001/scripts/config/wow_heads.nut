/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
local gt = this.getroottable();

if (!("Faces" in gt.Const))
{
	gt.Const.Faces <- {};
}

if (!("Hair" in gt.Const))
{
	gt.Const.Hair <- {};
}

if (!("HairColors" in gt.Const))
{
	gt.Const.HairColors <- {};
}

if (!("Bodies" in gt.Const))
{
	gt.Const.Bodies <- {};
}


//ELVES
gt.Const.HairColors.Elf <- [
	"elf1",
	"elf2",
	"elf3",
	"elf4"
];

gt.Const.Faces.ElfMale <- [
	"bust_head_21"
];

gt.Const.Hair.ElfMale <- [
	"01",
	"01",
	"01",
	"01"
];

gt.Const.Bodies.ElfMale <- [
	"bust_naked_body_03"
];


// GNOLLS
gt.Const.Faces.Gnoll <- [
	"bust_head_gnoll_01"
];

gt.Const.Bodies.Gnoll <- [
	"bust_naked_gnoll_body_01"
];