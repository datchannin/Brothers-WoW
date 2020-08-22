/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.08, game_version = 1.4.0.39*/
this.perk_wow_holyreach <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.holyreach";
		this.m.Name = this.Const.Wow_strings.PerkName.HolyReach;
		this.m.Description = this.Const.Wow_strings.PerkDescription.HolyReach;
		this.m.Icon = "ui/perks/perk_priest_holyreach.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});