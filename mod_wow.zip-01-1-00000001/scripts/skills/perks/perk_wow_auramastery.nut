/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_auramastery <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.auramastery";
		this.m.Name = this.Const.Wow_strings.PerkName.AuraMastery;
		this.m.Description = this.Const.Wow_strings.PerkDescription.AuraMastery;
		this.m.Icon = "ui/perks/perk_paladin_auramastery.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.AuraRadiusBonus += 1;
		if (_properties.T0_paladin_head)
		{
			_properties.AuraRadiusBonus += 1;
		}
	}
});