/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 081, game_version = 1.4.0.41*/
this.perk_wow_shadowburn <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warlock.shadowburn";
		this.m.Name = this.Const.Wow_strings.PerkName.Shadowburn;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Shadowburn;
		this.m.Icon = "ui/perks/perk_warlock_shadowburn.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});