/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_petcare <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.petcare";
		this.m.Name = this.Const.Wow_strings.PerkName.PetCare;
		this.m.Description = this.Const.Wow_strings.PerkDescription.PetCare;
		this.m.Icon = "ui/perks/perk_hunter_petcare.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});