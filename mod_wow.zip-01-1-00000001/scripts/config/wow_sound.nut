local gt = this.getroottable();

if (!("Wow_sound" in gt.Const))
{
	gt.Const.Wow_sound <- {};
}

gt.Const.Wow_sound <- {
	DefaultStaffEquip = [
		"sounds/combat/staff_equip01.ogg",
		"sounds/combat/staff_equip02.ogg",
		"sounds/combat/staff_equip03.ogg"
	]
}