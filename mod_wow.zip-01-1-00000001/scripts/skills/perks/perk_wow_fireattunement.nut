/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.09, game_version = 1.4.0.40*/
this.perk_wow_fireattunement <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.fireattunement";
		this.m.Name = this.Const.Wow_strings.PerkName.FireAttunement;
		this.m.Description = this.Const.Wow_strings.PerkDescription.FireAttunement;
		this.m.Icon = "ui/perks/perk_mage_fireattunement.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});