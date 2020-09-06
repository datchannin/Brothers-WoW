/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.01, game_version = 1.4.0.41*/
this.perk_wow_presenceofmind <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.presenceofmind";
		this.m.Name = this.Const.Wow_strings.PerkName.PresenceofMind;
		this.m.Description = this.Const.Wow_strings.PerkDescription.PresenceofMind;
		this.m.Icon = "ui/perks/perk_mage_presenceofmind.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.XPGainMult *= 1.4;
	}
});