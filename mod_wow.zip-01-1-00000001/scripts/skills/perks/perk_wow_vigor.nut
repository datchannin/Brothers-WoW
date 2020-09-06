/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.01, game_version = 1.4.0.41*/
this.perk_wow_vigor <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.vigor";
		this.m.Name = this.Const.Wow_strings.PerkName.Vigor;
		this.m.Description = this.Const.Wow_strings.PerkDescription.Vigor;
		this.m.Icon = "ui/perks/perk_rogue_vigor.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.ActionPointsBonus = 2;
	}	
});