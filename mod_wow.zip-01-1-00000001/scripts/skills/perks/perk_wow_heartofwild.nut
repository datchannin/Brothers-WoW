/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.perk_wow_heartofwild <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.druid.heartofwild";
		this.m.Name = this.Const.Wow_strings.PerkName.HeartofWild;
		this.m.Description = this.Const.Wow_strings.PerkDescription.HeartofWild;
		this.m.Icon = "ui/perks/perk_druid_heartofwild.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});