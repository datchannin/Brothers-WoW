/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.perk_wow_felintellect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.warlock.felintellect";
		this.m.Name = this.Const.Wow_strings.PerkName.FelIntellect;
		this.m.Description = this.Const.Wow_strings.PerkDescription.FelIntellect;
		this.m.Icon = "ui/perks/perk_warlock_felintellect.png";
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