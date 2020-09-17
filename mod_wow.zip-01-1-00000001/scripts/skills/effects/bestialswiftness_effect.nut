/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.bestialswiftness_effect <- this.inherit("scripts/skills/skill", {
	m = {
		ActionPointsBonusBase = 5,
		FatigueRecoveryRateBase = 10
	},
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

	function SetActionPointsBonusBase(_d)
	{
		this.m.ActionPointsBonusBase = _d;
	}

	function SetFatigueRecoveryRateBase(_d)
	{
		this.m.FatigueRecoveryRateBase = _d;
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
		_properties.ActionPointsBonus += this.m.ActionPointsBonusBase;
		_properties.FatigueRecoveryRate += this.m.FatigueRecoveryRateBase;
	}
});