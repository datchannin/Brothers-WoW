/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.perk_wow_sharpenedclaws <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.druid.sharpenedclaws";
		this.m.Name = this.Const.Wow_strings.PerkName.SharpenedClaws;
		this.m.Description = this.Const.Wow_strings.PerkDescription.SharpenedClaws;
		this.m.Icon = "ui/perks/perk_druid_sharpenedclaws.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});