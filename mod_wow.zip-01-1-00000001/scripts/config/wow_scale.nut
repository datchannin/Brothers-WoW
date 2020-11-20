/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
local gt = this.getroottable();

gt.Const.WarriorScale <- {
	toughness = 1
};

gt.Const.PaladinScale <- {
	holy_heal_min = 0.02,
	holy_heal_max = 0.03,
	devoutionaura = 1,
	concentrationaura = 1,
	retributionaura = 1,
	sanctityaura = 1
};

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

gt.Const.RogueScale <- {
	poison_damage = 0.05,
	poison_duration = 15,
	ambidextr = 1
};

gt.Const.PriestScale <- {
	heal_min = 0.03,
	heal_max = 0.04,
	repair_min = 0.04,
	repair_max = 0.04
};

gt.Const.MageScale <- {
	fire_damage_min = 0.01,
	fire_damage_max = 0.04,
	frost_damage_min = 0.02,
	frost_damage_max = 0.03,
	exp_share = 2,
	agat_restore = 2,
	agat_charges = 12
};

gt.Const.WarlockScale <- {
	shadow_damage_min = 0.02,
	shadow_damage_max = 0.04,
	curseofdoom = 0.1
};