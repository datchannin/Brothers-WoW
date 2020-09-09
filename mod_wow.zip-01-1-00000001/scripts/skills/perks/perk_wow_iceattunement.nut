/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.perk_wow_iceattunement <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.iceattunement";
		this.m.Name = this.Const.Wow_strings.PerkName.IceAttunement;
		this.m.Description = this.Const.Wow_strings.PerkDescription.IceAttunement;
		this.m.Icon = "ui/perks/perk_mage_iceattunement.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});