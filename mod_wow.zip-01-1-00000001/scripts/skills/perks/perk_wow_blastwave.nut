/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.01, game_version = 1.4.0.40*/
this.perk_wow_blastwave <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.blastwave";
		this.m.Name = this.Const.Wow_strings.PerkName.BlastWave;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BlastWave;
		this.m.Icon = "ui/perks/perk_mage_blastwave.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});