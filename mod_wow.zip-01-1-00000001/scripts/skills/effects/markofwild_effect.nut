/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.markofwild_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 3,
		ResolveValue = 20
	},
	function create()
	{
		this.m.ID = "effects.markofwild";
		this.m.Name = "Mark of Wild";
		this.m.Icon = "ui/perks/perk_druid_markofwild.png";
		this.m.IconMini = "effect_mini_markofwild";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character is under powerful buff for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
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
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Resolve is increased for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.ResolveValue + "[/color] points."
			}
		];
	}

	function setValue ( _d )
	{
		this.m.ResolveValue = _d;
	}

	function resetTime( _d )
	{
		this.m.TurnsLeft = _d;
	}

	function onUpdate( _properties )
	{
		_properties.Bravery += this.m.ResolveValue;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}
});