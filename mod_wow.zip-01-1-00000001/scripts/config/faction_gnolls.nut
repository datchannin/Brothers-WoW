/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
local gt = this.getroottable();

if (!("Tactical" in gt.Const))
{
	gt.Const.Tactical <- {};
}

if (!("Actor" in gt.Const.Tactical))
{
	gt.Const.Tactical.Actor <- {};
}

gt.Const.Tactical.Actor.GnollRookie <- {
	XP = 650,
	ActionPoints = 9,
	Hitpoints = 250,
	Bravery = 85,
	Stamina = 160,
	MeleeSkill = 75,
	RangedSkill = 65,
	MeleeDefense = 15,
	RangedDefense = 15,
	Initiative = 120,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		200,
		200
	],
	FatigueRecoveryRate = 25,
	DamageTotalMult = 1.05
};

gt.Const.Tactical.Actor.GnollMystic <- {
	XP = 720,
	ActionPoints = 12,
	Hitpoints = 250,
	Bravery = 95,
	Stamina = 200,
	MeleeSkill = 50,
	RangedSkill = 50,
	MeleeDefense = 5,
	RangedDefense = 5,
	Initiative = 130,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 35
};
gt.Const.Tactical.Actor.GnollShaman <- {
	XP = 820,
	ActionPoints = 11,
	Hitpoints = 230,
	Bravery = 95,
	Stamina = 200,
	MeleeSkill = 50,
	RangedSkill = 50,
	MeleeDefense = 5,
	RangedDefense = 5,
	Initiative = 130,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 35
};
gt.Const.Tactical.Actor.GnollPoacher <- {
	XP = 780,
	ActionPoints = 9,
	Hitpoints = 250,
	Bravery = 95,
	Stamina = 230,
	MeleeSkill = 60,
	RangedSkill = 90,
	MeleeDefense = 15,
	RangedDefense = 25,
	Initiative = 150,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 35,
	DamageTotalMult = 1.05
};
gt.Const.Tactical.Actor.GnollAssassin <- {
	XP = 820,
	ActionPoints = 9,
	Hitpoints = 320,
	Bravery = 110,
	Stamina = 300,
	MeleeSkill = 85,
	RangedSkill = 65,
	MeleeDefense = 30,
	RangedDefense = 15,
	Initiative = 150,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 35,
	DamageTotalMult = 1.05
};
gt.Const.Tactical.Actor.GnollBrute <- {
	XP = 950,
	ActionPoints = 9,
	Hitpoints = 370,
	Bravery = 150,
	Stamina = 270,
	MeleeSkill = 85,
	RangedSkill = 65,
	MeleeDefense = 25,
	RangedDefense = 15,
	Initiative = 130,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 35,
	DamageTotalMult = 1.1
};