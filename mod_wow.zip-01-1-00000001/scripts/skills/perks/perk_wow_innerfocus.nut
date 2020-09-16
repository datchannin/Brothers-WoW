/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.perk_wow_innerfocus <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.innerfocus";
		this.m.Name = this.Const.Wow_strings.PerkName.InnerFocus;
		this.m.Description = this.Const.Wow_strings.PerkDescription.InnerFocus;
		this.m.Icon = "ui/perks/perk_priest_innerfocus.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.MeleeSkill -= 10;
		_properties.RangedSkill -= 10;
		_properties.MeleeDefense += 10;
		_properties.RangedDefense += 10;
	}
});