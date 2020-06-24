this.perk_wow_endurancetraining <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.hunter.endurancetraining";
		this.m.Name = this.Const.Wow_strings.PerkName.EnduranceTraining;
		this.m.Description = this.Const.Wow_strings.PerkDescription.EnduranceTraining;
		this.m.Icon = "ui/perks/perk_hunter_endurancetraining.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.IsPetEnduranceTraining = true;
	}
});