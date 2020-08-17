/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.05, game_version = 1.4.0.37*/
this.perk_wow_thickhide <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.thickhide";
		this.m.Name = this.Const.Wow_strings.PerkName.ThickHide;
		this.m.Description = this.Const.Wow_strings.PerkDescription.ThickHide;
		this.m.Icon = "ui/perks/perk_hunter_thickhide.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsPetThickHide = true;
	}
});