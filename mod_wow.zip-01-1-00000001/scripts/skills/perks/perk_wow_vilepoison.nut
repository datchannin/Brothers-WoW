/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 5.08, game_version = 1.4.0.39*/
this.perk_wow_vilepoison <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.rogue.vilepoison";
		this.m.Name = this.Const.Wow_strings.PerkName.VilePoison;
		this.m.Description = this.Const.Wow_strings.PerkDescription.VilePoison;
		this.m.Icon = "ui/perks/perk_rogue_vilepoison.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsMasterInPoison = true;
	}
});