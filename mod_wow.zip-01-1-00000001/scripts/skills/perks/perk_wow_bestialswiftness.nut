/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.01, game_version = 1.4.0.41*/
this.perk_wow_bestialswiftness <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.bestialswiftness";
		this.m.Name = this.Const.Wow_strings.PerkName.BestialSwiftness;
		this.m.Description = this.Const.Wow_strings.PerkDescription.BestialSwiftness;
		this.m.Icon = "ui/perks/perk_hunter_bestialswiftness.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsPetBestialSwiftness = true;
	}
});