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

gt.Const.HairColors.Elf <- [
	"elf",
];

gt.Const.Faces.ElfMale <- [
	"bust_head_21"
];

gt.Const.Hair.ElfMale <- [
	"01"
];

gt.Const.Bodies.ElfMale <- [
	"bust_naked_body_03"
];