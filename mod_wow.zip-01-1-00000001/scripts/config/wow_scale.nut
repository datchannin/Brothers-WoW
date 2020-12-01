/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
local gt = this.getroottable();

// SCALE COEFFICIENTS FOR PLAYER CHARACTERS DEPENDS ON LEVEL
// Warrior
gt.Const.WarriorScale <- {
	toughness = 1
};

// Paladin
gt.Const.PaladinScale <- {
	holy_heal_min = 0.02,
	holy_heal_max = 0.03,
	devoutionaura = 1,
	concentrationaura = 1,
	retributionaura = 1,
	sanctityaura = 1
};

// Hunter
gt.Const.HunterScale <- {
	pet_health_bonus = 10,			// +10% per hunter level
	pet_stamina_bonus = 0.1,
	pet_meleedefense_bonus = 0.5,
	pet_rangeddefense_bonus = 0.5,
	pet_actionpoints_bonus = 0.25,
	pet_fatiguerecovery_bonus = 1,
	pet_meleeskill_bonus = 1.5,
	pet_bravery_bonus = 2,
	pet_mend_min = 0.04,
	pet_mend_max = 0.07,
};

// Druid
gt.Const.DruidScale <- {
	markofwild = 1,
	rejuvenation = 0.05,
	innervate = 0.01,
	maulmin = 0.05,
	maulmax = 0.07,
	frenziedregeneration = 1,
	direbearhealth = 0.01,
	direbeardravery = 0.01,
	clawsmin = 0.05,
	clawsmax = 0.07,
	bitemin = 0.02,
	bitemax = 0.04,
	tigerap = 0.2
};

// Rogue
gt.Const.RogueScale <- {
	poison_damage = 0.05,
	poison_duration = 15,
	ambidextr = 1
};

// Priest
gt.Const.PriestScale <- {
	heal_min = 0.03,
	heal_max = 0.04,
	repair_min = 0.04,
	repair_max = 0.04
};

// Mage
gt.Const.MageScale <- {
	fire_damage_min = 0.01,
	fire_damage_max = 0.04,
	fire_damage_pyroblast = 0.12,
	frost_damage_min = 0.02,
	frost_damage_max = 0.03,
	exp_share = 2,
	agat_restore = 2,
	agat_charges = 12
};

// Warlock
gt.Const.WarlockScale <- {
	shadow_damage_min = 0.02,
	shadow_damage_max = 0.04,
	curseofdoom = 0.1
};

// SCALE COEFFICIENTS FOR ENEMY CHARACTERS DEPENDS ON DAY AND DIFFICULTY
// Hitpoints Mult
gt.Const.HitpointsScase <- {
	day10 = 1.05,
	day30 = 1.09,
	day50 = 1.14,
	day70 = 1.2,
	day90 = 1.25,
	day110 = 1.31,
	day130 = 1.37,
	day150 = 1.46,
	day170 = 1.50,
	day190 = 1.56,
	day210 = 1.62,
	day230 = 1.70,
	day250 = 1.75,
	day270 = 1.81,
	day290 = 1.89,
	day310 = 1.96,
	day330 = 2.00,
	day350 = 2.08,
	day370 = 2.16,
	day390 = 2.25,
	day400 = 2.33
}