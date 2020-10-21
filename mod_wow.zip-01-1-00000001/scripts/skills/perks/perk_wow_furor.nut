/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_furor <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.druid.furor";
		this.m.Name = this.Const.Wow_strings.PerkName.Furor;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Furor;
		this.m.Icon = "ui/perks/perk_druid_furor.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});