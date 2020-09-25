/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.perk_wow_hardness <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warrior.hardness";
		this.m.Name = this.Const.Wow_strings.PerkName.Hardness;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Hardness;
		this.m.Icon = "ui/perks/perk_warrior_hardness.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.Stamina += 20;
	}

});