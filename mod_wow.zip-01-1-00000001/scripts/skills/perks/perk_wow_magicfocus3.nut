/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 081, game_version = 1.4.0.41*/
this.perk_wow_magicfocus3 <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.magicfocus3";
		this.m.Name = this.Const.Wow_strings.PerkName.MagicFocus3;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MagicFocus3;
		this.m.Icon = "ui/perks/perk_mage_magicfocus3.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});