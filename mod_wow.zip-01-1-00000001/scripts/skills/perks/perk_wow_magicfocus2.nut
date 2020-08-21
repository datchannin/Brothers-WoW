/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.07, game_version = 1.4.0.39*/
this.perk_wow_magicfocus2 <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.magicfocus2";
		this.m.Name = this.Const.Wow_strings.PerkName.MagicFocus2;
		this.m.Description = this.Const.Wow_strings.PerkDescription.MagicFocus2;
		this.m.Icon = "ui/perks/perk_mage_magicfocus2.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});