/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.fade_effect <- this.inherit("scripts/skills/skill", {
	m = {
		BaseDuration = 1,
		TurnsLeft = 1
	},
	function create()
	{
		this.m.ID = "effects.fade";
		this.m.Name = "Fade";
		this.m.Icon = "ui/perks/perk_priest_fade.png";
		this.m.IconMini = "effect_mini_fade";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character faded out for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
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
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Ignores hostile Zone of Control"
			},
		];
	}

	function setDuration( _d )
	{
		this.m.BaseDuration = _d;
	}

	function onAdded()
	{
		this.m.TurnsLeft = this.m.BaseDuration;
	}

	function reset()
	{
		this.m.TurnsLeft = this.m.BaseDuration;
	}

	function onUpdate( _properties )
	{
		_properties.IsImmuneToZoneOfControl = true;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}
});