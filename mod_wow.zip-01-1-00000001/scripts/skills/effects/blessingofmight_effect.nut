/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.blessingofmight_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2,
		Power = 20
	},
	function create()
	{
		this.m.ID = "effects.blessingofmight";
		this.m.Name = "Blessing of Might";
		this.m.Icon = "ui/perks/perk_paladin_blessingofmight.png";
		this.m.IconMini = "effect_mini_blessingofmight";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function setValue( _d )
	{
		this.m.Power = _d;
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
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done is increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Power + "%[/color]"
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
		local percent = this.m.Power * 0.01;
		_properties.DamageTotalMult *= (1 + percent);
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}
});