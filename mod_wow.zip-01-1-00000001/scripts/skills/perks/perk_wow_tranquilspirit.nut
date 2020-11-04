this.perk_wow_tranquilspirit <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.druid.tranquilspirit";
		this.m.Name = this.Const.Wow_strings.PerkName.TranquilSpirit;
		this.m.Description = this.Const.Wow_strings.PerkDescription.TranquilSpirit;
		this.m.Icon = "ui/perks/perk_druid_tranquilspirit.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.BraveryMult *= 1.25;
		if (this.m.Container.hasSkill("effects.bearform"))
		{
			_properties.IsAffectedByLosingHitpoints = false;
		}
		else
		{
			_properties.IsAffectedByLosingHitpoints = true;
		}
	}
});

