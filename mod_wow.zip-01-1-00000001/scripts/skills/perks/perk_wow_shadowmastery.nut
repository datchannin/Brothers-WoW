/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.perk_wow_shadowmastery <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warlock.shadowmastery";
		this.m.Name = this.Const.Wow_strings.PerkName.ShadowMastery;
		this.m.Description = this.Const.Wow_strings.PerkDescription.ShadowMastery;
		this.m.Icon = "ui/perks/perk_warlock_shadowmastery.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});