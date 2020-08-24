/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.01, game_version = 1.4.0.40*/
this.perk_wow_recoveryfracture <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.recoveryfracture";
		this.m.Name = this.Const.Wow_strings.PerkName.RecoveryFracture;
		this.m.Description = this.Const.Wow_strings.PerkDescription.RecoveryFracture;
		this.m.Icon = "ui/perks/perk_priest_recoveryfracture.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});