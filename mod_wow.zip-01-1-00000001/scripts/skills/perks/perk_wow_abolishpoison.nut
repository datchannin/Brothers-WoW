/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.41*/
this.perk_wow_abolishpoison <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.druid.abolishpoison";
		this.m.Name = this.Const.Wow_strings.PerkName.AbolishPoison;
		this.m.Description = this.Const.Wow_strings.PerkDescription.AbolishPoison;
		this.m.Icon = "ui/perks/perk_druid_abolishpoison.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});