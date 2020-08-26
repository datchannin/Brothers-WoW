/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 6.02, game_version = 1.4.0.40*/
this.perk_wow_divinespirit <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.priest.divinespirit";
		this.m.Name = this.Const.Wow_strings.PerkName.DivineSpirit;
		this.m.Description = this.Const.Wow_strings.PerkDescription.DivineSpirit;
		this.m.Icon = "ui/perks/perk_priest_divinespirit.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.Stamina += 15;
	}
});