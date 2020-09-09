/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 7.02, game_version = 1.4.0.41*/
this.bestialswiftness_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.bestialswiftness";
		this.m.Name = "Bestial Swiftness";
		this.m.Description = "";
		this.m.Icon = "ui/perks/perk_hunter_bestialswiftness.png";
		this.m.IconMini = "effect_mini_bestialswiftness";
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
		_properties.ActionPointsBonus += 5;
		_properties.FatigueRecoveryRate += 10;
	}
});