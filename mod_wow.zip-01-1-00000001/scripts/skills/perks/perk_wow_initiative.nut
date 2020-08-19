/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.06, game_version = 1.4.0.38*/
this.perk_wow_initiative <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.initiative";
		this.m.Name = this.Const.Wow_strings.PerkName.Initiative;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Initiative;
		this.m.Icon = "ui/perks/perk_rogue_initiative.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.Initiative += 20;
		_properties.IsImmuneToRoot = true;
	}
});