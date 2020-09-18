/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
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
	pet_health_bonus = 10,
	pet_stamina_bonus = 0.1,
	pet_meleedefense_bonus = 1,
	pet_rangeddefense_bonus = 1,
	pet_actionpoints_bonus = 0.5,
	pet_fatiguerecovery_bonus = 1,
	pet_meleeskill_bonus = 1.5,
	pet_bravery_bonus = 2,
	pet_mend_min = 0.1,
	pet_mend_max = 0.15,
};

gt.Const.RogueScale <- {
	poison_damage = 0.05,
	poison_duration = 15
};

gt.Const.MageScale <- {
	fire_damage_min = 0.01,
	fire_damage_max = 0.04,
	frost_damage_min = 0.02,
	frost_damage_max = 0.03
};

gt.Const.WarlockScale <- {
	shadow_damage_min = 0.02,
	shadow_damage_max = 0.04,
	curseofdoom = 0.1
};