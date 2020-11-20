/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.perk_wow_demonskin <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warlock.demonskin";
		this.m.Name = this.Const.Wow_strings.PerkName.DemonSkin;
		this.m.Description = this.Const.Wow_strings.PerkDescription.DemonSkin;
		this.m.Icon = "ui/perks/perk_warlock_demonskin.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});