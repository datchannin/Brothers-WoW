/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.06, game_version = 1.4.0.38*/
this.perk_wow_fortitude <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.fortitude";
		this.m.Name = this.Const.Wow_strings.PerkName.Fortitude;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Fortitude;
		this.m.Icon = "ui/perks/perk_priest_fortitude.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});