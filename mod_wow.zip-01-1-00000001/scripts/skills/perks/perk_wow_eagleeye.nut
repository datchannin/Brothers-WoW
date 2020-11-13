/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_eagleeye <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.eagleeye";
		this.m.Name = this.Const.Wow_strings.PerkName.EagleEye;
		this.m.Description = this.Const.Wow_strings.PerkDescription.EagleEye;
		this.m.Icon = "ui/perks/perk_hunter_eagleeye.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.Vision += 1;
	}
});