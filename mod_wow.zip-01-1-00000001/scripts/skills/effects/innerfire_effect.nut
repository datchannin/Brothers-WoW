/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.03, game_version = 1.4.0.43*/
this.innerfire_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.innerfire";
		this.m.Name = "Inner Fire";
		this.m.Icon = "ui/perks/perk_priest_innerfire.png";
		this.m.IconMini = "effect_mini_innerfire";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character is under Inner Fire buff for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
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
				icon = "ui/icons/melee_defense.png",
				text = "Melee Defense is increased by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color]"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Ranged Defense is increased by [color=" + this.Const.UI.Color.PositiveValue + "]15[/color]"
			}
		];
	}

	function reset()
	{
		if (this.m.TurnsLeft != 2)
		{
			this.m.TurnsLeft = 2;
		}
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDefense += 15;
		_properties.RangedDefense += 15;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}
});