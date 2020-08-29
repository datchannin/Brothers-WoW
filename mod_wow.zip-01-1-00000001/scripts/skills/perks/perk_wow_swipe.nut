/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.40*/
this.perk_wow_swipe <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.druid.swipe";
		this.m.Name = this.Const.Wow_strings.PerkName.Swipe;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Swipe;
		this.m.Icon = "ui/perks/perk_druid_swipe.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});