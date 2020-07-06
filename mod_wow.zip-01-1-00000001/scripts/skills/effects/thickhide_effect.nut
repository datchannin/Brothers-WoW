this.thickhide_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.thickhide";
		this.m.Name = "Thick Hide";
		this.m.Description = "";
		this.m.Icon = "ui/perks/perk_hunter_thickhide.png";
		this.m.IconMini = "effect_mini_thickhide";
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
		_properties.MeleeDefense += 40;
		_properties.RangedDefense += 40;
	}
});