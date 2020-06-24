this.endurancetraining_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.endurancetraining";
		this.m.Name = "Endurance Training";
		this.m.Description = "";
		this.m.Icon = "ui/perks/effect_warrior_stunimmunity.png";
		this.m.IconMini = "effect_mini_stunimmunity";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
		];
	}

	function onUpdate( _properties )
	{
		_properties.HitpointsMult *= 2;
		_properties.Stamina += 40;
	}

});