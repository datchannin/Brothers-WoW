/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.04, game_version = 1.4.0.44*/
this.perk_wow_winterschill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.winterschill";
		this.m.Name = this.Const.Wow_strings.PerkName.WintersChill;
		this.m.Description = this.Const.Wow_strings.PerkDescription.WintersChill;
		this.m.Icon = "ui/perks/perk_mage_winterschill.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});