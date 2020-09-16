/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.perk_wow_clarity <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.druid.clarity";
		this.m.Name = this.Const.Wow_strings.PerkName.Clarity;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Clarity;
		this.m.Icon = "ui/perks/perk_druid_clarity.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});