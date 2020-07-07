this.perk_wow_arcaneintellect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.arcaneintellect";
		this.m.Name = this.Const.Wow_strings.PerkName.ArcaneIntellect;
		this.m.Description = this.Const.Wow_strings.PerkDescription.ArcaneIntellect;
		this.m.Icon = "ui/perks/perk_mage_arcaneintellect.png";
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