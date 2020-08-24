/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.09, game_version = 1.4.0.40*/
this.perk_wow_recoverymaximum <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.recoverymaximum";
		this.m.Name = this.Const.Wow_strings.PerkName.RecoveryMaximum;
		this.m.Description = this.Const.Wow_strings.PerkDescription.RecoveryMaximum;
		this.m.Icon = "ui/perks/perk_priest_recoveyrmaximum.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});