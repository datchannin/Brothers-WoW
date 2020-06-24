this.perk_wow_lightingreflexes <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.lightingreflexes";
		this.m.Name = this.Const.Wow_strings.PerkName.LightingReflexes;
		this.m.Description = this.Const.Wow_strings.PerkDescription.LightingReflexes;
		this.m.Icon = "ui/perks/perk_hunter_lightingreflexes.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.Stamina += 10;
		_properties.Initiative += 10;
	}
});