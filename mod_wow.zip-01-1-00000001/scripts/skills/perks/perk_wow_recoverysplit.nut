/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.40*/
this.perk_wow_recoverysplit <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.recoverysplit";
		this.m.Name = this.Const.Wow_strings.PerkName.RecoverySplit;
		this.m.Description = this.Const.Wow_strings.PerkDescription.RecoverySplit;
		this.m.Icon = "ui/perks/perk_priest_recoverysplit.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});