/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.07, game_version = 1.4.0.39*/
this.perk_wow_recoverypierce <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.recoverypierce";
		this.m.Name = this.Const.Wow_strings.PerkName.RecoveryPierce;
		this.m.Description = this.Const.Wow_strings.PerkDescription.RecoveryPierce;
		this.m.Icon = "ui/perks/perk_priest_recoverypierce.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});